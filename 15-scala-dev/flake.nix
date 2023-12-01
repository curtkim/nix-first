{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-utils = {
      url = "github:numtide/flake-utils";
    };
    sbt.url = "github:zaninime/sbt-derivation";
    sbt.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, flake-utils, sbt }: flake-utils.lib.eachDefaultSystem (system:
    let
      pkgs = import nixpkgs { 
        inherit system; 
        overlays = [
          (final: prev: {
            sbt = prev.sbt.overrideAttrs {postPatch = "";};
          })
        ];
      };
    in rec {
      devShells.default = pkgs.mkShell {
        buildInputs = [pkgs.sbt pkgs.metals pkgs.jdk17_headless];
      };

      packages.default = sbt.mkSbtDerivation.${system} {
        depsSha256 = "sha256-vnMVuODFLhLuGpYlOmt4v7sezcORROTSzNVBi8WJhOc=";
        pname = "nix-scala-example";
        version = "0.1.0";

        src = ./.;

        buildInputs = [pkgs.sbt pkgs.jdk17_headless pkgs.makeWrapper];

        buildPhase = "sbt assembly";

        installPhase = ''
            mkdir -p $out/bin
            mkdir -p $out/share/java

            cp target/scala-2.13/*.jar $out/share/java

            makeWrapper ${pkgs.jdk17_headless}/bin/java $out/bin/nix-scala-example \
              --add-flags "-cp \"$out/share/java/*\" com.example.nixscalaexample.Main"
        '';
      };
    }
  );
}
