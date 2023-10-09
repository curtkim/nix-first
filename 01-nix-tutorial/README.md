https://nix-tutorial.gitlabpages.inria.fr/nix-tutorial/first-package.html

## howto

    nix-build chord_example.nix
    ./result/bin/chord --help
    nix-shell --pure chord_example.nix

