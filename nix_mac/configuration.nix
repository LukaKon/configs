{ config, pkgs, ... }:

{
  imports =
			[ # Include the results of the hardware scan.
				./hardware-configuration.nix
				./system.nix		# Base system settings
				./network.nix		# Network configuration
				./programs.nix		# List of installed programs
				./sound.nix
				./locale.nix
				./security/doas.nix	# Add 'doas'
				./services/openssh.nix	# SSH
				./programs/postgresql.nix	# PostgreSQL
				./desktops/qtile.nix	# Qtile window manager settings
				# ./desktops/spectrwm.nix
				./desktops/gnome.nix	# Gnome window manager settings
				./desktops/xmonad/xmonad.nix	# Gnome window manager settings
				# ./desktops/i3/i3.nix
				# ./desktops/mate.nix	# Mate window manager settings
				# ./services/keyring.nix	# included in Gnome desktop
				./services/laptop.nix   # settings for laptop
				./services/remote.nix
				./programs/zsh.nix	# zsh and console settings
				./fonts.nix		# Fonts to install
				./nixpkgs.nix
				./users.nix		# Users configurations
				./shellAliases.nix	# Shell aliases
				./virtualisation/docker.nix	# Docker
				./programs/nvim.nix		# TODO nvim configuration in separate files
				# ./services/flatpak.nix
			];
}
