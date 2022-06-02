{ config, pkgs, lib, ... }:

let
  user = "lk";
  password = "lk";
  SSID = "5G-LuKa";
  SSIDpassword = "Kropeczka";
  interface = "wlan0";
  hostname = "raspi";
in
{
  imports = [
    # "${fetchTarball "https://github.com/NixOS/nixos-hardware/archive/936e4649098d6a5e0762058cb7687be1b2d90550.tar.gz" }/raspberry-pi/4"

    ./../modules/system/fonts.nix
    ./../modules/system/shellAliases.nix
    ./../modules/system/kk.nix
    ./../modules/services/openssh.nix
    ./../modules/virtualisation/docker.nix
    #./../modules/virtualisation/virt-manager.nix
    ./../modules/security/doas.nix
    ./../modules/security/firewall.nix
    ./../modules/programs/raspi_progr.nix
    #./../modules/programs/flatpak.nix
    ./../modules/programs/zsh.nix
    ./../modules/desktops/xfce.nix
  ];

  boot.cleanTmpDir = true;

  boot = {
    kernelPackages = pkgs.linuxPackages_rpi4;
    # tmpOnTmpfs = true; # See note
    kernelParams = [
      "8250.nr_uarts=1"
      "console=ttyAMA0,115200"
      "console=tty1"
      "cma=128M"
    ];
    loader = {
      grub.enable = false;
      raspberryPi = {
        enable = true;
        version = 4;
      };
      generic-extlinux-compatible.enable = true;
    };
  };

  hardware.enableRedistributableFirmware = true;

  fileSystems = {
    "/" = {
      device = "/dev/disk/by-label/NIXOS_SD";
      fsType = "ext4";
      options = [ "noatime" ];
    };
  };

  nixpkgs.config.allowUnfree = true;

  # Localisation
  time.timeZone = "Europe/Warsaw";

  i18n = {
    defaultLocale = "pl_PL.UTF-8";
    supportedLocales = [ "pl_PL.UTF-8/UTF-8" "en_US.UTF-8/UTF-8" ];
  };

  # Autoupgrade
  system = {
    autoUpgrade = {
      enable = true;
      #allowReboot = true;
    };
  };

  # cleaning store
  nix = {
    autoOptimiseStore = true;
    gc = {
      automatic = true;
      dates = "daily";
      options = "--delete-older-than 7d";
    };

    # For nix flakes
    extraOptions = "experimental-features = nix-command flakes";
    package = pkgs.nixFlakes;
  };

  networking = {
    hostName = hostname;
    wireless = {
      enable = true;
      networks."${SSID}".psk = SSIDpassword;
      interfaces = [ interface ];
    };
  };

  users = {
    mutableUsers = false;
    users."${user}" = {
      isNormalUser = true;
      password = password;
      extraGroups = [ "wheel" "networkmanager" "docker" ];
      shell = pkgs.zsh;
      packages = with pkgs;
        [
          #exercism
        ];
    };
  };

  # Enable GPU acceleration
  # hardware.raspberry-pi."4".fkms-3d.enable = true;

  hardware.pulseaudio = {
    enable = true;
    #support32Bit = true;
    # extraModules = with pkgs; [ pulseaudio-modules-bt ];
    #package = pkgs.pulseaudioFull;
    #extraConfig = ''
    #    load-module module-switch-on-connect
    #'';
  };

  #powerManagement.cpuFreqGovernor = lib.mkDefault "powersave";

  # services.tlp.enable = true;
  #powerManagement.powertop.enable = true;

  #security.protectKernelImage = true;
}
