{ config, lib, pkgs, ... }:

{
  services = {
    xserver.libinput = {
      enable = true;
      touchpad.tapping = true;
    };

    # illum, a daemon for controlling screen brightness with brightness buttons. 
    illum.enable = true;

    # Redshift change screen's colour temperature depending on the time of day. 
    redshift = {
      enable = true;
      brightness = {
        day = "0.6";
        night = "0.4";
      };
    };

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

  # probably for redshift
  # should point to Wroclaw
  location = {
    longitude = 17.0;
    latitude = 51.0;
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
