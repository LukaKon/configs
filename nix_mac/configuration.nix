{ config, pkgs, ... }:

{
	imports =
		[ # Include the results of the hardware scan.
		./hardware-configuration.nix
		../nix/system.nix		# Base system settings
		../nix/btrfs.nix
		./network.nix		# Network configuration
		../nix/programs.nix		# List of installed programs
		../nix/security/doas.nix	# Add 'doas'
		../nix/services/openssh.nix	# SSH
		../nix/programs/postgresql.nix	# PostgreSQL
		# ./desktops/kde.nix
		../nix/desktops/gnome.nix	# Gnome window manager settings
		# ./services/keyring.nix	# included in Gnome desktop
		./services/laptop.nix   # settings for laptop
		# ./services/remote.nix
		../nix/programs/zsh.nix	# zsh and console settings
		../nix/fonts.nix		# Fonts to install
		../nix/users.nix		# Users configurations
		../nix/shellAliases.nix	# Shell aliases
		../nix/virtualisation/docker.nix	# Docker
		./programs/nvim/nvim.nix
		../nix/services/flatpak.nix
	];
}
