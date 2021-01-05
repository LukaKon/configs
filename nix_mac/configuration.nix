{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./system.nix		# Base system settings
      ./network.nix		# Network configuration
      ./programs.nix		# List of installed programs
      ./security/doas.nix	# Add 'doas'
      ./services/openssh.nix	# SSH
      ./services/postgresql.nix	# PostgreSQL
      # ./services/desktops/qtile.nix	# Qtile window manager settings
      # ./services/desktops/plasma.nix	# Plasma window manager settings
      # ./services/desktops/lxqt.nix	# LXQT window manager settings
      ./services/desktops/mate.nix	# Mate window manager settings
      ./services/keyring.nix
      ./services/laptop.nix   # settings for laptop
      ./programs/zsh.nix	# zsh and console settings
      ./fonts.nix		# Fonts to install
      ./nixpkgs/nixpkgs.nix
      ./users.nix		# Users configurations
      ./shellAliases.nix	# Shell aliases
      ./virtualisation/docker.nix	# Docker 
      ./nvim/nvim.nix		# TODO nvim configuration in separate files
    ];
}
