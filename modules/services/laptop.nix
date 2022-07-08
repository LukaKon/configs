{ config, lib, pkgs, ... }:

{
  services = {
    xserver.libinput = {
      enable = true;
      touchpad.tapping = true;
    };

    # illum, a daemon for controlling screen brightness with brightness buttons. 
    illum.enable = true;

    logind = {
      lidSwitch = "ignore";
      extraConfig = "HandleLidSwitch=ignore";
      lidSwitchExternalPower = "ignore";
    };

    upower = {
      usePercentageForPolicy = true;
      percentageLow = 20;
      percentageCritical = 5;
      percentageAction = 2;
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
