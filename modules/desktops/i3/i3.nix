{ config, lib, pkgs, ... }:

{
  services = {
    xserver = {
      enable = true;
      # displayManager.lightdm.enable = true;
      displayManager.defaultSession = "none+i3";

      desktopManager.xterm.enable = false;

      windowManager.i3 = {
        enable = true;
        configFile = ./i3.conf;
        extraPackages = with pkgs; [
          dmenu
          i3status
          i3lock
          # i3blocks
        ];
      };

      layout = "pl";
    };
    autorandr.enable = true;
  };
  environment.systemPackages = with pkgs; [
    lxappearance
  ];
  environment.pathsToLink = [ "/libexec" ];
}

