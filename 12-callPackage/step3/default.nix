let pkgs = import <nixpkgs> {}; in
rec {
  hello = pkgs.callPackage ./hello.nix {};
  people = pkgs.callPackage ./hello.nix {audience = "people";};
  folks = hello.override {audience = "folks";};
}
