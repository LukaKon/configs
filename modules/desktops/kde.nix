{ config, lib, ... }:

{
  services.xserver = {
    enable = true;

    displayManager.sddm.enable = true;
    # displayManager.gdm.wayland.enable = true;
    desktopManager.plasma5.enable = true;

    layout = "pl";
  };
}
