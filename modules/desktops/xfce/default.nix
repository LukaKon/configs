{ config, lib, pkgs, ... }:

{
  services.xserver = {
    enable = true;
    displayManager.lightdm.enable = true;
    desktopManager.xfce.enable = true;
    layout = "pl";
  };

  environment = {
    systemPackages = with pkgs;
      [
      ];
  };
}
