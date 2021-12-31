{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
    ./hardware-configuration.nix

    # System
    ./../modules/system/system.nix        # Base system settings
    ./../modules/system/btrfs.nix
    ./../modules/system/network_mac.nix       # Network configuration
    # ./../modules/system/nouveau.nix
    ./../modules/system/fonts.nix
    ./../modules/system/env_variables.nix
    # ./../modules/system/cron.nix
    ./../modules/system/shellAliases.nix  # Shell aliases
    ./../modules/system/users.nix     # Users configurations

    # Security
    ./../modules/security/doas.nix # Add 'doas'
    ./../modules/security/firewall.nix

    # Services
    ./../modules/services/openssh.nix  # SSH
    ./../modules/services/keyring.nix
    # ./../modules/services/bluetooth.nix
    # ./../modules/services/remote.nix # remote server/desktop
    ./../modules/services/laptop.nix

    # Programs
    ./../modules/programs/mac_progr.nix
    ./../modules/programs/nvim/nvim.nix
    # ./../modules/programs/postgresql.nix
    ./../modules/programs/zsh.nix
    # ./../modules/programs/steam.nix        # Steam gaming portal
    ./../modules/programs/flatpak.nix

    # Desktops
    # ./../modules/desktops/i3/i3.nix  # i3 window manager settings
    # ./../modules/desktops/x_gnome.nix  # Gnome window manager settings
    # ./../modules/desktops/wayland_gnome.nix  # Gnome window manager settings
    ./../modules/desktops/qtile.nix

    # Virtualisation
    # ./../modules/virtualisation/docker.nix # Docker
    ./../modules/virtualisation/podman.nix
    # ./../modules/virtualisation/virtualbox.nix # Virtualbox
    ./../modules/virtualisation/virt-manager.nix
  ];
}
