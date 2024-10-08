{
  description = "Rust-Nix";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
    flake-parts.url = "github:hercules-ci/flake-parts";
    rust-crate2nix = {
      url = "github:kolloch/crate2nix";
      flake = false;
    };
    rust-overlay.url = "github:oxalica/rust-overlay";
  };

  outputs = inputs @ {
    self,
    nixpkgs,
    flake-parts,
    rust-crate2nix,
    rust-overlay,
    ...
  } : flake-parts.lib.mkFlake { inherit inputs; } {
    flake = {
    };
    systems = [
      "x86_64-linux"
      "x86_64-darwin"
    ];
    perSystem = { system, pkgs, ... }: let
      overlays = [
        (import rust-overlay)
        (self: super: let
          toolchain = super.rust-bin.fromRustupToolchainFile ./rust-toolchain.toml;
        in {
          rustc = toolchain;
        })
      ];
      pkgs = import nixpkgs { inherit system overlays; };

      # Main build target
      project = let
        crateTools = pkgs.callPackage "${rust-crate2nix}/tools.nix" { inherit pkgs; };
      in import (crateTools.generatedCargoNix {
        name = "rustnix";
        src = ./.;
      }) {
        inherit pkgs;
      };
    in rec {
      packages = {
        rustnix = project.rootCrate.build;
        default = packages.rustnix;
      };
      devShells.default = pkgs.mkShell {
        buildInputs = [pkgs.rustc];
      };
    };
  };
}
