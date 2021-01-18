{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./system.nix		# Base system settings
      ./sound.nix     # sound
      ./locale.nix    # system localisation
      ./network.nix		# Network configuration
      ./programs.nix		# List of installed programs
      ./security/doas.nix	# Add 'doas'
      ./services/openssh.nix	# SSH
      ./services/postgresql.nix	# PostgreSQL
      # ./services/desktops/qtile.nix	# Qtile window manager settings
      ./services/desktops/i3/i3.nix	# i3 window manager settings
      # ./services/desktops/mate.nix	# mate window manager settings
      # ./services/desktops/plasma.nix	# Plasma window manager settings
      # ./services/desktops/spectrwm.nix	# Spectrwm window manager settings
      ./services/keyring.nix
      ./programs/zsh.nix	# zsh and console settings
      ./programs/steam.nix		# Steam gaming portal
      ./fonts.nix		# Fonts to install
      ./hdd.nix			# Additional HDD
      ./nixpkgs/nixpkgs.nix
      ./users.nix		# Users configurations
      ./shellAliases.nix	# Shell aliases
      ./virtualisation/docker.nix	# Docker 
      ./virtualisation/virtualbox.nix	# Virtualbox
      ./nvim/nvim.nix		# TODO nvim configuration in separate files
      # ./flatpak.nix
    ];
}
