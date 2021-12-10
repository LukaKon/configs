{config, lib, pkgs, ... }:

{
  services = {
    xserver = {
      enable = true;
      windowManager.exwm = true;

    layout = "pl";
    };
    autorandr.enable = true;
  };
}
