{
  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";
    poetry2nix = {
      url = "github:nix-community/poetry2nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, poetry2nix, flake-utils, ... } : 
    flake-utils.lib.eachDefaultSystem (system: 
      let 
        pkgs = nixpkgs.legacyPackages.${system};
        p2n = poetry2nix.lib.mkPoetry2Nix { inherit pkgs; };
        poetry_customOverrides = final: prev: {
          comtypes = prev.comtypes.overridePythonAttrs
          (
            old: {
              buildInputs = (old.buildInputs or []) ++ [prev.setuptools];
            }
          );
        };
        inherit (p2n) mkPoetryApplication;
      in 
      {
        packages = {
          myapp = mkPoetryApplication {
            projectDir = self;
            overrides = [p2n.defaultPoetryOverrides poetry_customOverrides];
          };
          default = self.packages.${system}.myapp;
        };

        devShells.default = pkgs.mkShell {
          #inputsFrom = [self.packages.${system}.myapp];
          packages = [pkgs.poetry];
        };
      }
    );
}

