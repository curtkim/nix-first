{ lib
, stdenv
, coreutils
, bash
, pkg-config
, gcc
, gtk4
}:

stdenv.mkDerivation {
  name = "hello-world-gtk";

  builder = "${bash}/bin/bash";
  args = [ ./builder.sh ];
  system = builtins.currentSystem;

  src = "hello-world-gtk.c";

  nativeBuildInputs = [ coreutils pkg-config gcc];
  buildInputs = [ gtk4 ];

  doCheck = false;

  coreutils = coreutils;
  gcc = gcc;
  pkgconfig = pkg-config;
}
