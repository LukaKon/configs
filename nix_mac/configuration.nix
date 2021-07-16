{ config, pkgs, ... }:

{
	imports =
		[ # Include the results of the hardware scan.
		./hardware-configuration.nix
		./system.nix		# Base system settings
		./btrfs.nix
		./network.nix		# Network configuration
		./programs.nix		# List of installed programs
		./sound.nix
		./locale.nix
		./security/doas.nix	# Add 'doas'
		./services/openssh.nix	# SSH
		./programs/postgresql.nix	# PostgreSQL
		# ./desktops/kde.nix
		./desktops/gnome.nix	# Gnome window manager settings
		# ./services/keyring.nix	# included in Gnome desktop
		./services/laptop.nix   # settings for laptop
		# ./services/remote.nix
		./programs/zsh.nix	# zsh and console settings
		./fonts.nix		# Fonts to install
		./nixpkgs.nix
		./users.nix		# Users configurations
		./shellAliases.nix	# Shell aliases
		./virtualisation/docker.nix	# Docker
		./programs/nvim/nvim.nix
		./services/flatpak.nix
	];
}
