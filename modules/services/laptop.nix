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
        day = "1.0";
        night = "0.8";
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
      percentageCritical = 15;
      percentageAction = 10;
    };
  };

  # probably for redshift
  # should point to Wroclaw
  location = {
    longitude = 17.0;
    latitude = 51.0;
  };

  hardware.acpilight.enable = true;
  
  sound.mediaKeys = {
    enable = true;
    volumeStep = "4%";
  };

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
