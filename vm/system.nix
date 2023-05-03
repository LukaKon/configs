{ config, pkgs, lib, ... }:

{
  # Use the systemd-boot EFI boot loader.
  boot = {
   loader = {
    
    systemd-boot.enable = true;
   efi.canTouchEfiVariables = false;
    efi.efiSysMountPoint = "/boot/efi";
  };
   tmp.cleanOnBoot= true;
   supportedFilesystems = [ "ntfs" ];

  kernel.sysctl = { "vm.overcommit_memory" = true; };
  };


  # boot.loader.systemd-boot.enable = true;
  # boot.loader.efi.canTouchEfiVariables = true;
  # boot.loader.efi.efiSysMountPoint = "/boot/efi";

  powerManagement = {
    enable = true;
    cpuFreqGovernor = lib.mkDefault "powersave";
  };

  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;

  # The temperature management daemon
  services.thermald.enable = true;


  # non-free
  # already in flake
  nixpkgs.config.allowUnfree = true;

  # Localisation
  time.timeZone = "Europe/Warsaw";


  i18n = {
    defaultLocale = "pl_PL.UTF-8";
    supportedLocales = [ "pl_PL.UTF-8/UTF-8" "en_US.UTF-8/UTF-8" ];
  };

  # cleaning store
  nix = {
    settings = {
      auto-optimise-store = true;
      max-jobs = lib.mkDefault 4;
    };

    gc = {
      automatic = true;
      dates = "daily";
      options = "--delete-older-than 9d";
    };

    # For hix flakes
    extraOptions = "experimental-features = nix-command flakes";
    package = pkgs.nixFlakes;
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "22.11"; # Did you read the comment?
}