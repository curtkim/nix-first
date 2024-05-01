let pkgs = import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/ae8bdd2de4c23b239b5a771501641d2ef5e027d0.tar.gz") {};
in

builtins.derivation {
  name = "paperjam-fake";
  builder = "${pkgs.bash}/bin/bash";
  args = [ ./build-paperjam.sh];
  system = builtins.currentSystem;

  SOURCE = pkgs.fetchurl {
    url = "https://mj.ucw.cz/download/linux/paperjam-1.2.tar.gz";
    hash = "sha256-0AziT7ROICTEPKaA4Ub1B8NtIfLmxRXriW7coRxDpQ0";
  };

  CXX="clang++";
  PATH = "${pkgs.gzip}/bin:${pkgs.gnutar}/bin:${pkgs.gnumake}/bin:${pkgs.clang}/bin:${pkgs.asciidoc}/bin:${pkgs.coreutils}/bin:${pkgs.bash}/bin";
  LD = "-L ${pkgs.qpdf}/lib   -L ${pkgs.libpaper}/lib -L ${pkgs.libcxxabi}/lib -liconv -L ${pkgs.libiconv}/lib ";
  CXXFLAGS = "-isystem ${pkgs.qpdf}/include   -isystem ${pkgs.libpaper}/include";
}
