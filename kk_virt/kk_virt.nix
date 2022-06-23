{ config, pkgs, ... }:

{
  imports =
    [
      # Include the results of the hardware scan.
      ./hardware-configuration.nix

      # System
      ./../modules/system/system.nix # Base system settings
      ./../modules/system/fonts.nix
      ./../modules/system/env_variables.nix
      # ./../modules/system/cron.nix
      ./../modules/system/shellAliases.nix # Shell aliases
      # ./../modules/system/lk.nix
      ./../modules/system/kk.nix

      # Security
      ./../modules/security/doas.nix # Add 'doas'
      ./../modules/security/firewall.nix

      # Services
      ./../modules/services/openssh.nix # SSH
      #./../modules/services/keyring.nix

      # Programs
      ./../modules/programs/progr.nix
      ./../modules/programs/zsh.nix
      ./../modules/programs/flatpak.nix

      # Desktops
      ./../modules/desktops/kde.nix
    ];
networking.hostId="8556b001";

  networking = {
    hostName = "kkvirt"; # Define your hostname.
    networkmanager.enable = true;
  };

  boot.loader.efi.efiSysMountPoint = "/boot/efi";
}
