{ config, pkgs ? import <nixpkgs> { }, ... }:

let cfg = config.module.essential.android;
in {
  options.module.essential.android = {
    enable = mkEnableOption "Essential Android tools";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      adb-sync
      gnirehtet
      libmtp
      scrcpy
    ];
  };
}
