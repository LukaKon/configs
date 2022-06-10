{ config, pkgs, lib, ... }:

{
  imports =
    [
      # Include the results of the hardware scan.
      ./hardware-configuration.nix

      # System
      #./../modules/system/system.nix # Base system settings
      ./../modules/system/network.nix # Network configuration
      ./../modules/system/fonts.nix
      ./../modules/system/env_variables.nix
      # ./../modules/system/cron.nix
      ./../modules/system/shellAliases.nix # Shell aliases
      ./../modules/system/lk.nix

      # Security
      ./../modules/security/doas.nix # Add 'doas'
      ./../modules/security/firewall.nix

      # Services
      ./../modules/services/openssh.nix # SSH
      #./../modules/services/keyring.nix
      # ./../modules/services/bluetooth.nix
      #./../modules/services/remote.nix # remote server/desktop

      # Programs
      ./../modules/programs/progr_virt.nix
      #./../modules/programs/kakoune.nix
      #./../modules/programs/nvim/nvim.nix
      ./../modules/programs/zsh.nix
      ./../modules/programs/flatpak.nix

      # Virtualisation
      ./../modules/virtualisation/podman.nix # Podman
      ./../modules/virtualisation/docker.nix # Docker
      #./../modules/virtualisation/virt-manager.nix
    ];

  boot.loader.grub = {
    enable = true;
    version = 2;
    device = "/dev/vda";
  };

  services.xserver = {
      enable = true;

      displayManager.lightdm.enable = true;
      # displayManager.gdm.wayland.enable = true;
      desktopManager.xfce.enable = true;
      #windowManager.openbox.enable = true;

      layout = "pl";
  };


  # Localisation
  time.timeZone = "Europe/Warsaw";

  i18n = {
    defaultLocale = "pl_PL.UTF-8";
    supportedLocales = [ "pl_PL.UTF-8/UTF-8" "en_US.UTF-8/UTF-8" ];
  };

  # cleaning store
  nix = {
    autoOptimiseStore = true;
    gc = {
      automatic = true;
      dates = "daily";
      options = "--delete-older-than 3d";
    };

    maxJobs = lib.mkDefault 4;

    # For hix flakes
    extraOptions = "experimental-features = nix-command flakes";
    package = pkgs.nixFlakes;
  };
  system.stateVersion = "22.05"; # Did you read the comment?
}
