{ config, lib, pkgs, ... }:

{
  services.xserver = {
    enable = true;
    displayManager.lightdm.enable = true;
    windowManager.leftwm.enable = true;
    displayManager.defaultSession = "none+leftwm";
    layout = "pl";
  };

  environment = {
    systemPackages = with pkgs;
      [
        rofi
        polybar
        picom
        # conky
        dunst
      ];
  };
}
