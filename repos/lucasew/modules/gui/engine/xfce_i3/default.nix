{ global, config, pkgs, lib, ... }:
let
  inherit (lib) mkForce;

  inherit (pkgs.custom) wallpaper colorpipe;
in
  {
    imports = [
      ./polybar.nix
      ./i3.nix
      ./dunst.nix
      ./lockscreen.nix
    ];
    services.xserver = {
      enable = true;
      displayManager.defaultSession = "none+i3";
      desktopManager = {
        xterm.enable = false;
        xfce = {
          enable = true;
          noDesktop = true;
          enableXfwm = false;
          enableScreensaver = false;
          thunarPlugins = with pkgs.xfce; [
            thunar-media-tags-plugin
            thunar-archive-plugin
          ];
        };
      };
      windowManager.i3 = {
        enable = true;
        configFile = "/etc/i3config";
      };
    };
    services.picom = {
      enable = true;
      vSync = true;
    };
    environment.etc.wallpaper.source = wallpaper;
  }
