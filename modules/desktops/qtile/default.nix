{ config, lib, pkgs, ... }:

{
  services.xserver = {
    enable = true;

    # Qtile
    displayManager.lightdm.enable = true;
    windowManager.qtile.enable = true;
    displayManager.defaultSession = "none+qtile";

    layout = "pl";
  };

  environment = {
    systemPackages = with pkgs;
      [
        rofi
      ];
  };
}
