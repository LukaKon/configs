{ config, lib, ... }:

{
  services.xserver = {
    enable = true;

    # Xfce
    displayManager.lightdm.enable = true;
    # displayManager.gdm.wayland.enable = true;
    desktopManager.xfce.enable = true;

    layout = "pl";
  };
}
