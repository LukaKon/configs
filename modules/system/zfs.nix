{ config, pkgs, lib, ... }:

{
  boot.supportedFilesystems = [ "zfs" ];

  networking.hostId = "cf635851";

  # ZFS services
  services = {
    zfs = {
      autoSnapshot = {
        enable = true;
        daily = 5;
        weekly = 5;
        monthly = 10;
      };
      autoScrub = {
        enable = true;
        interval = "weekly";
      };
    };
  };
}
