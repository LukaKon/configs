{ config, lib, ... }:

{
  services.xserver = {
    enable = true;

    displayManager = {
      sddm.enable = true;
      autoLogin.user = "kk"
    desktopManager.plasma5.enable = true;

    layout = "pl";
  };
}
