{ config, pkgs, ... }:

{
  imports =
			[ # Include the results of the hardware scan.
				./hardware-configuration.nix
				./system.nix		# Base system settings
				./nvidia.nix
				./sound.nix     # sound
				./locale.nix    # system localisation
				./network.nix		# Network configuration
				./programs.nix		# List of installed programs
				./env_variables.nix
				./security/doas.nix	# Add 'doas'
				./services/openssh.nix	# SSH
				./services/postgresql.nix	# PostgreSQL
				# ./services/desktops/qtile.nix	# Qtile window manager settings
				# ./services/desktops/i3/i3.nix	# i3 window manager settings
				# ./services/desktops/gnome/gnome.nix	# Gnome window manager settings
				./services/desktops/spectrwm.nix
				./services/desktops/xmonad/xmonad.nix
				./services/keyring.nix
				# ./services/bluetooth.nix
				./services/remote.nix	# remote server/desktop
				./services/cron.nix
				./programs/zsh.nix	# zsh and console settings
				./programs/steam.nix		# Steam gaming portal
				./fonts.nix		# Fonts to install
				./hdd.nix			# Additional HDD
				./nfs.nix
				./nixpkgs/nixpkgs.nix
				./users.nix		# Users configurations
				./shellAliases.nix	# Shell aliases
				./virtualisation/docker.nix	# Docker
				./virtualisation/virtualbox.nix	# Virtualbox
				./virtualisation/virt-manager.nix
				./nvim/nvim.nix		# TODO nvim configuration in separate files
				# ./flatpak.nix
				# ./programs/vscode/vscode.nix    # vscode-with-extensions
				# ./programs/vscode/vs_conf.nix   # vscode-with-extensions
			];
}
