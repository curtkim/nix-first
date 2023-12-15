# https://librephoenix.com/2023-12-03-making-your-nixos-config-more-modular
{config, pkgs, ...}:
{
  imports = [
    ./42-module2.nix
  ];
  zsh.enable = false;
}
