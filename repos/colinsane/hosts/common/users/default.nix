{ config, pkgs, lib, sane-lib, ... }:

{
  imports = [
    ./colin.nix
    ./guest.nix
    ./root.nix
  ];

  users.groups.media = {};

  # Users are exactly these specified here;
  # old ones will be deleted (from /etc/passwd, etc) upon upgrade.
  users.mutableUsers = false;

  security.sudo = {
    enable = true;
    wheelNeedsPassword = false;
  };
}
