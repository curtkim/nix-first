## reference
- https://leni.sh/post/231021-rust-nix-environment/
- https://nixos.wiki/wiki/Rust#Packaging_Rust_projects_with_nix


## 1. simple

    let
      # Pinned nixpkgs, deterministic. Last updated: 2/12/21.
      pkgs = import (fetchTarball("https://github.com/NixOS/nixpkgs/archive/a58a0b5098f0c2a389ee70eb69422a052982d990.tar.gz")) {};

      # Rolling updates, not deterministic.
      # pkgs = import (fetchTarball("channel:nixpkgs-unstable")) {};
    in pkgs.mkShell {
      buildInputs = [ pkgs.cargo pkgs.rustc ];
    }

