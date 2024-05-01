https://husin.dev/poetry2nix/


## howto

    nix develop
    poetry lock
    exit
    nix build

## internal

    ❯ cat result/bin/hello_poetry2nix
    #! /nix/store/m0s1xf30bdk6vfn5m6c3mhb2z8w1cib5-bash-5.2-p15/bin/bash -e
    PATH=${PATH:+':'$PATH':'}
    PATH=${PATH/':''/nix/store/3b8938gc677hqy6v3gcsil8pd33qw54c-python3.11-hello-poetry2nix-0.1.0/bin'':'/':'}
    PATH='/nix/store/3b8938gc677hqy6v3gcsil8pd33qw54c-python3.11-hello-poetry2nix-0.1.0/bin'$PATH
    PATH=${PATH#':'}
    PATH=${PATH%':'}
    export PATH
    PATH=${PATH:+':'$PATH':'}
    PATH=${PATH/':''/nix/store/8dzgagiwp6xi6hahsdgq6y4kb5v8kn4j-python3-3.11.8/bin'':'/':'}
    PATH='/nix/store/8dzgagiwp6xi6hahsdgq6y4kb5v8kn4j-python3-3.11.8/bin'$PATH
    PATH=${PATH#':'}
    PATH=${PATH%':'}
    export PATH
    export PYTHONNOUSERSITE='true'
    exec -a "$0" "/nix/store/3b8938gc677hqy6v3gcsil8pd33qw54c-python3.11-hello-poetry2nix-0.1.0/bin/.hello_poetry2nix-wrapped"  "$@"

