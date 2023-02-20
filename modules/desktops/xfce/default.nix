{ config, lib, pkgs, ... }:

{
  services.xserver = {
    enable = true;
    displayManager.sddm.enable = true;
    # desktopManager.plasma5.enable = true;
    windowManager.xfce.enable = true;
    layout = "pl";
  };

  environment = {
    systemPackages = with pkgs;
      [
        # libsForQt5.bismuth
      ];
  };
}
