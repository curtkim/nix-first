{ pkgs ? import <nixpkgs> {} }:

let
  # Configure Nix to allow unfree packages.
  config = {
    allowUnfree = true;
  };
  pkgs = import <nixpkgs> { inherit config; };
in
pkgs.mkShell rec {
  buildInputs = [ 
    pkgs.python311 
    pkgs.python311Packages.torchWithCuda
  ];

  #LD_LIBRARY_PATH = "${pkgs.lib.makeLibraryPath buildInputs}:${pkgs.stdenv.cc.cc.lib}/lib";
  #LD_LIBRARY_PATH = lib.makeLibraryPath [ pkgs.stdenv.cc.cc ];
}

