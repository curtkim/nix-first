## reference
https://nixcademy.com/2023/10/31/cpp-with-nix-in-2023-part-1-shell/

## howto

    nix flake init -t github:hercules-ci/flake-parts

    cmake -B build -S .
    cmake --build build

## update the toolchain

    nix flake update --commit-lock-file

## Summary
- Reproducible Env
- No Need for containers or VMs
- cross-platform
- Flexibility with compilers
- Easy Upgrades
