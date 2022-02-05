{config, lib, pkgs, ...}:

{
  services.xserver = {
    enable = true;
    # displayManager.startx.enable = true;  # necessary to
    # create .xinitrc file

    #displayManager.sddm.enable = true;
    desktopManager.plasma5.enable = true;

    layout = "pl";
  };