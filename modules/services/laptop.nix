{ config, lib, pkgs, ... }:

{
  services = {
    xserver.libinput = {
      enable = true;
      touchpad.tapping = true;
    };
    logind = {
      lidSwitch = "ignore";
      lidSwitchExternalPower = "ignore";
    };
  };
  hardware.acpilight.enable = true;

  environment = {
    systemPackages = with pkgs;
      [
        acpi # battery status
        xorg.xbacklight
        light
        acpilight
        brightnessctl
      ];
  };
}
