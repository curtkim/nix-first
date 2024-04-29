{
  description = "torch with cuda";

  inputs = {
    flake-parts.url = "github:hercules-ci/flake-parts";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";
  };

  nixConfig = {
    experimental-features = [ "nix-command" "flakes" ];
    # additional caches for CUDA packages.
    # these packages are not included in the normal Nix cache, as they run
    # under an unfree license
    trusted-substituters = [
      "https://cuda-maintainers.cachix.org"
    ];
    trusted-public-keys = [
      "cuda-maintainers.cachix.org-1:0dq3bujKpuEPMCX6U4WylrUDZ9JyUG0VpVZa7CNfq5E="
    ];
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
      perSystem = { config, self', inputs', pkgs, system,  ... }: let 
#        torchtext = pkgs.callPackage ./torchtext.nix { 
#          buildPythonPackage = pkgs.python311Packages.buildPythonPackage; 
#          pytorch = pkgs.python311Packages.torchWithCuda; 
#          pybind11 = pkgs.python311Packages.pybind11;
#          pytestCheckHook = pkgs.python311Packages.pytestCheckHook;
#          requests = pkgs.python311Packages.requests;
#          tqdm = pkgs.python311Packages.tqdm;
#        };
      in {
        # Per-system attributes can be defined here. The self' and inputs'
        # module parameters provide easy access to attributes of the same
        # system.

        devShells.default = pkgs.mkShell {
          packages = [ pkgs.python311 ] ++ (with pkgs.python311Packages; [
            ipython
            torchWithCuda
            transformers
            portalocker
            accelerate
          ]);
        };
      };

      flake = {
        # The usual flake attributes can be defined here, including system-
        # agnostic ones like nixosModule and system-enumerating ones, although
        # those are more easily expressed in perSystem.

      };
    };
}
