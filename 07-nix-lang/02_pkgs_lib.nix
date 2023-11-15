let
  pkgs = import <nixpkgs> {};
in
pkgs.lib.strings.toUpper "search paths considered harmful"

