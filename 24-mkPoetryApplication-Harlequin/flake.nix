{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";
    poetry2nix = {
      url = "github:nix-community/poetry2nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = { self, nixpkgs, ... } @ inputs: rec {
    # Custom packages
    packages.x86_64-linux.default = import ./harlequin.nix rec {
      lib = nixpkgs.lib;
      pkgs = nixpkgs.legacyPackages.x86_64-linux;
      python3 = pkgs.python3;
      fetchPypi = pkgs.fetchPypi;
      fetchFromGitHub = pkgs.fetchFromGitHub;
      poetry2nix = inputs.poetry2nix.lib.mkPoetry2Nix { inherit pkgs; };
    };
  };
}
