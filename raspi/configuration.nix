
{ config, pkgs, lib, ... }:

let
  user = "lk";
  password = "lk";
  SSID = "5G-LuKa";
  SSIDpassword = "Kropeczka";
  interface = "wlan0";
  hostname = "raspi";
in {
  imports = [
    # "${fetchTarball "https://github.com/NixOS/nixos-hardware/archive/936e4649098d6a5e0762058cb7687be1b2d90550.tar.gz" }/raspberry-pi/4"

    ./../modules/system/system.nix
    ./../modules/system/fonts.nix
    ./../modules/system/shellAliases.nix
    ./../modules/services/openssh.nix
    ./../modules/virtualisation/docker.nix
    ./../modules/virtualisation/virt-manager.nix
    ./../modules/security/doas.nix
    ./../modules/security/firewall.nix
    ./../modules/programs/raspi_progr.nix
    ./../modules/programs/flatpak.nix
    ./../modules/programs/zsh.nix
    ./../modules/programs/postgresql.nix
    ./../modules/programs/nvim/nvim.nix
    ./../modules/desktops/wayland_gnome.nix
  ];

  fileSystems = {
    "/" = {
      device = "/dev/disk/by-label/NIXOS_SD";
      fsType = "ext4";
      options = [ "noatime" ];
    };
  };

  networking = {
    hostName = hostname;
  #   wireless = {
  #     enable = true;
  #     networks."${SSID}".psk = SSIDpassword;
  #     interfaces = [ interface ];
# };
  };

  users = {
    mutableUsers = false;
    users."${user}" = {
      isNormalUser = true;
      password = password;
      extraGroups = [ "wheel" "networkmanager" "dialout" "libvirtd" "docker" ];
      shell = pkgs.zsh;
      packages = with pkgs;
      [
        exercism
      ];
    };
  };

    # Enable GPU acceleration
    # hardware.raspberry-pi."4".fkms-3d.enable = true;

    hardware.pulseaudio = {
      enable = true;
      support32Bit = true;
      # extraModules = with pkgs; [ pulseaudio-modules-bt ];
      package = pkgs.pulseaudioFull;
      extraConfig = ''
          load-module module-switch-on-connect
      '';
    };

    powerManagement.cpuFreqGovernor = lib.mkDefault "powersave";

    # services.tlp.enable = true;
    powerManagement.powertop.enable = true;

    security.protectKernelImage = true;

  }
