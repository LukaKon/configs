{config, ...}:

{
  boot = {
  	    loader.grub.enable = true;
  	    loader.grub.version = 2;
  	# boot.loader.grub.efiSupport = true;
  	# boot.loader.grub.efiInstallAsRemovable = true;
  	# boot.loader.efi.efiSysMountPoint = "/boot/efi";
  	# Define on which hard drive you want to install Grub.
	    loader.grub.device = "/dev/sda"; # or "nodev" for efi only
	    loader.grub.useOSProber = true;
        };

  
  system = {
          autoUpgrade = {
          enable = true;
          allowReboot = true;
        };

      };

  nix.gc = {
              automatic = true;
              dates = "weekly";
              options = "--delete-older-than 5d";
            };

  
  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "20.09"; # Did you read the comment?
}
