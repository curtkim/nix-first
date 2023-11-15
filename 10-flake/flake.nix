{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";

    outpus = {self, nixpkgs, flake-utils}: 
      flake-utils.lib.eachDefaultSystem (system: let
        pkgs = nixpkgs.legacyPackges.${system};
      in {
        devShells.default = pkgs.mkShell {
	  packages = [pkgs.nodejs];
	  shellHook = ''
	    echo "node `${pkgs.nodes}/bin/node --version`"
	  '';
	};
       });
  };
}

