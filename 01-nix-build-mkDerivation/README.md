https://nix-tutorial.gitlabpages.inria.fr/nix-tutorial/first-package.html

## howto

    nix-build chord_example.nix        # pkgs.stdenv.mkDerivation를 사용한다.
    ./result/bin/chord --help
    nix-shell --pure chord_example.nix # ? 실행되는 건지 잘 모르겠다.

