{
  description = "hello world gtk";

  inputs = {
    flake-parts.url = "github:hercules-ci/flake-parts";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = inputs@{ flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      imports = [
        # To import a flake module
        # 1. Add foo to inputs
        # 2. Add foo as a parameter to the outputs function
        # 3. Add here: foo.flakeModule

      ];
      systems = [ "x86_64-linux" "aarch64-linux" "aarch64-darwin" "x86_64-darwin" ];
      perSystem = { config, self', inputs', pkgs, system, ... }: {
        # The `callPackage` automatically fills the parameters of the function
        # in package.nix with what's inside the `pkgs` attribute.
        packages = {
          default = pkgs.callPackage ./package.nix { };
          static = pkgs.pkgsStatic.callPackage ./package.nix { };
          clang = pkgs.callPackage ./package.nix {stdenv = pkgs.clangStdenv;};
        };
        # The `config` variable contains our own outputs, so we can reference
        # neighbor attributes like the package we just defined one line earlier.
        devShells.default = config.packages.default;
      };

      flake = {
        # The usual flake attributes can be defined here, including system-
        # agnostic ones like nixosModule and system-enumerating ones, although
        # those are more easily expressed in perSystem.

      };
    };
}
