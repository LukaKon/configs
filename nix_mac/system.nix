
{config, pkgs, ...}:

{
  # Use the systemd-boot EFI boot loader.
<<<<<<< HEAD
  boot = {
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;
    cleanTmpDir = true;
    supportedFilesystems = [ "ntfs" ];
  };

    # Sound
    sound.enable = true;
    hardware.pulseaudio.enable = true;

    nixpkgs.config.allowUnfree = true;
=======
	boot = {
			loader.systemd-boot.enable = true;
			loader.efi.canTouchEfiVariables = true;
			cleanTmpDir = true;
			supportedFilesystems = [ "ntfs" ];
		};

	# Sound
	sound.enable = true;
	hardware.pulseaudio.enable = true;

	nixpkgs.config.allowUnfree = true;
>>>>>>> 63c222799baead810f0a0ad729298eb5ab25a193

  # Localisation
  time.timeZone = "Europe/Warsaw";

  i18n = {
    defaultLocale = "pl_PL.UTF-8";
<<<<<<< HEAD
    # supportedLocales = ["pl_PL.UTF-8/UTF-8" "en_US.UTF-8/UTF-8"];
  };

  system = {
    autoUpgrade = {
      enable = true;
      allowReboot = true;
    };
  };

  nix.gc = {
    automatic = true;
    dates = "daily";
    options = "--delete-older-than 5d";
  };

    # For hix flakes
    # nix.package = [ pkgs.nixUnstable pkgs.nixFlakes ];
    # extraOptions = "experimental-features = nix-command flakes";
=======
    supportedLocales = ["pl_PL.UTF-8/UTF-8" "en_US.UTF-8/UTF-8"];
  };

	system = {
				autoUpgrade = {
					enable = true;
					allowReboot = true;
				};
			};

	nix.gc = {
				automatic = true;
				dates = "daily";
				options = "--delete-older-than 5d";
			};
	# For hix flakes
    extraOptions = "experimental-features = nix-command flakes";
    package = pkgs.nixFlakes;
>>>>>>> 63c222799baead810f0a0ad729298eb5ab25a193

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
