# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

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
      ./services/pulpit.nix	# Desktop and window manager settings
      ./services/keyring.nix
      ./programs/zsh.nix	# zsh and console settings
      ./fonts.nix		# Fonts to install
      ./hdd.nix			# Additional HDD
      ./nixpkgs/nixpkgs.nix
      ./nixpkgs/qtile.nix	# Qtile additional libs
      ./users.nix		# Users configurations
      ./shellAliases.nix	# Shell aliases
      ./virtualisation/docker.nix	# Docker 
      ./virtualisation/virtualbox.nix	# Virtualbox
      ./nvim/nvim.nix		# TODO nvim configuration in separate files
      ./steam.nix		# Steam gaming portal
    ];
}
