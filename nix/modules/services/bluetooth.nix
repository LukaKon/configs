{ config, pkgs, lib, ... }:
{

  # bluetooth
  hardware.bluetooth = {
    enable = true; #false;
  };

  environment.defaultPackages = with pkgs;
    [
      bluez
      # blueman
    ];
}
