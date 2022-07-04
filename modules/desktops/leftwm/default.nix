{ config, lib, pkgs, ... }:

{
  services.xserver = {
    enable = true;
    # displayManager.startx.enable = true;  # necessary to
    # create .xinitrc file

    displayManager.lightdm.enable = true;
    # displayManager.gdm.wayland.enable = true;
    windowManager.leftwm.enable = true;
    displayManager.defaultSession = "leftwm";

    layout = "pl";
  };

  environment = {
    systemPackages = with pkgs;
      [
        rofi
      ];
  };
}
