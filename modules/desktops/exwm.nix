{config, lib, pkgs, ... }:

{
  services = {
    xserver = {
      enable = true;
      windowManager.exwm.enable = true;

    layout = "pl";
    };
    autorandr.enable = true;
  };
}
