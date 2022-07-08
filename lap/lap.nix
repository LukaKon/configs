{ config, pkgs, ... }:

{
  imports =
    [
      # Include the results of the hardware scan.
      ./hardware-configuration.nix

      # System
      ./../modules/system/system.nix # Base system settings
      ./../modules/system/network_lap.nix # Network configuration
      ./../modules/system/fonts.nix
      ./../modules/system/env_variables.nix
      # ./../modules/system/cron.nix
      ./../modules/system/shellAliases.nix # Shell aliases
      ./../modules/system/lk.nix
      #./../modules/system/kk.nix

      # Security
      ./../modules/security/doas.nix # Add 'doas'
      ./../modules/security/firewall.nix

      # Services
      ./../modules/services/openssh.nix # SSH
      ./../modules/services/keyring.nix
      # ./../modules/services/bluetooth.nix
      # ./../modules/services/remote.nix # remote server/desktop
      ./../modules/services/laptop.nix

      # Programs
      ./../modules/programs/progr.nix
      # ./../modules/programs/vim
      #./../modules/programs/nixvim.nix
      ./../modules/programs/nvim/nvim.nix
      #./../modules/programs/kakoune.nix
      ./../modules/programs/zsh.nix
      ./../modules/programs/flatpak.nix

      # Desktops
      # ./../modules/desktops/i3/i3.nix  # i3 window manager settings
      ./../modules/desktops/qtile
      # ./../modules/desktops/leftwm
      # ./../modules/desktops/spectrwm

      # Virtualisation
      ./../modules/virtualisation/docker.nix # Docker
      # ./../modules/virtualisation/podman.nix
      ./../modules/virtualisation/arion.nix
      ./../modules/virtualisation/virt-manager.nix
    ];

  networking.hostId = "4195cf38";
}
