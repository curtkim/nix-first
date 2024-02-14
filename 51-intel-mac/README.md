## reference
https://www.arthurkoziel.com/installing-nixos-on-a-macbookpro/

## howto

    nix-build '<nixpkgs/nixos>' -A config.system.build.isoImage -I nixos-config=iso.nix
