{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell rec {
  buildInputs = [ 
    pkgs.python3 
    pkgs.git 
    pkgs.stdenv.cc.cc.lib 
    pkgs.zlib
  ]; # Python version and other dependencies

  LD_LIBRARY_PATH = "${pkgs.lib.makeLibraryPath buildInputs}:${pkgs.stdenv.cc.cc.lib}/lib";
  #LD_LIBRARY_PATH = lib.makeLibraryPath [ pkgs.stdenv.cc.cc ];
}

