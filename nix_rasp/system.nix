{config, pkgs, ...}:

{
  boot = {
    kernelPackages = pkgs.linuxPackages_rpi4;
    tmpOnTmpfs = true;
    initrd.availableKernelModules = [ "usbhid" "usb_storage" ];
    # ttyAMA0 is the serial console broken out to the GPIO
    kernelParams = [
        "8250.nr_uarts=1"
        "console=ttyAMA0,115200"
        "console=tty1"
        # Some gui programs need this
        "cma=128M"
    ];
  loader = {
    raspberryPi = {
      enable = true;
      version = 4;
    };
    grub.enable = false;
    generic-extlinux-compatible.enable = true;
};


  # Required for the Wireless firmware
  hardware.enableRedistributableFirmware = true;

  # Packages
  nixpkgs.config.allowUnfree = true;

  # Sound
  sound.enable = true;
    hardware.pulseaudio.enable = true;
    boot.loader.raspberryPi.firmwareConfig = ''
        dtparam=audio=on
    '';

  # Localisation
  time.timeZone = "Europe/Warsaw";

    i18n = {
				defaultLocale = "pl_PL.UTF-8";
				supportedLocales = ["pl_PL.UTF-8/UTF-8" "en_US.UTF-8/UTF-8"];
         };

	system = {
				autoUpgrade = {
				enable = true;
				allowReboot = true;
				};
			};

	nix = {
		autoOptimiseStore = true;
		gc = {
			automatic = true;
			dates = "daily";
			options = "--delete-older-than 3d";
				};
  };
  powerManagement.cpuFreqGovernor = "ondemand";
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
  system.stateVersion = "21.05"; # Did you read the comment?
}
