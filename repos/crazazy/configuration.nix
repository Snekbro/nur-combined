{ config, pkgs, ... }:
{
  imports = [
    ./hardware/elitebook840g5-tmpfs.nix
    ./modules/system-configuration
    ./modules/desktop-configuration
    ./modules/users-configuration
  ];
  tmpfs-setup.enable = builtins.pathExists "/nix/persist";
}
