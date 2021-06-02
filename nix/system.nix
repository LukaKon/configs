{config, ...}:

{
  # Use the systemd-boot EFI boot loader.
	boot = {
				loader.systemd-boot.enable = true;
				loader.efi.canTouchEfiVariables = true;
			};

	system = {
				autoUpgrade = {
				enable = true;
				#allowReboot = true;
        channel = https://nixos.org/channels/nixos-21.05;
				};
			};

	nix.gc = {
				automatic = true;
				dates = "daily";
				options = "--delete-older-than 3d";
            };

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "20.09"; # Did you read the comment?
}
