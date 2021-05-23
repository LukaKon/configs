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
				./env_variables.nix
				./security/doas.nix	# Add 'doas'
				./security/firewall.nix
				./services/openssh.nix	# SSH
				./programs/postgresql.nix	# PostgreSQL
				# ./desktops/i3/i3.nix	# i3 window manager settings
				./desktops/spectrwm.nix
				# ./desktops/qtile.nix
				./desktops/mate.nix
				./services/keyring.nix
				./services/remote.nix	# remote server/desktop
				./services/cron.nix
				./programs/zsh.nix	# zsh and console settings
				# ./programs/steam.nix		# Steam gaming portal
				./fonts.nix		# Fonts to install
				# ./hdd.nix			# Additional HDD
				./nfs.nix
				./nixpkgs.nix
				./users.nix		# Users configurations
				./shellAliases.nix	# Shell aliases
				./virtualisation/docker.nix	# Docker
				./virtualisation/virt-manager.nix # broken
				./programs/nvim.nix		# TODO nvim configuration in separate files
				# ./services/flatpak.nix
			];
}
