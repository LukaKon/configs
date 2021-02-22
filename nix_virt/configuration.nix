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
				./services/nginx.nix
				./services/desktops/mate.nix	# mate window manager settings
				./services/keyring.nix
				./services/remote.nix	# remote server/desktop
				./programs/zsh.nix	# zsh and console settings
				./fonts.nix		# Fonts to install
				./nixpkgs/nixpkgs.nix
				./users.nix		# Users configurations
				./shellAliases.nix	# Shell aliases
				./virtualisation/docker.nix	# Docker
				./nvim/nvim.nix		# TODO nvim configuration in separate files
				# ./flatpak.nix
				# ./programs/vscode/vscode.nix    # vscode-with-extensions
				# ./programs/vscode/vs_conf.nix   # vscode-with-extensions
			];
}
