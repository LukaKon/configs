
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
    "${fetchTarball "https://github.com/NixOS/nixos-hardware/archive/936e4649098d6a5e0762058cb7687be1b2d90550.tar.gz" }/raspberry-pi/4"

    ../nix/system.nix
    ../nix/fonts.nix
    ../nix/shellAliases.nix
    ../nix/services/flatpak.nix
    ../nix/services/openssh.nix
    ../nix/virtualisation/docker.nix
    ../nix/virtualisation/virt-manager.nix
    ../nix/security/doas.nix
    ../nix/security/firewall.nix
    ../nix/programs/zsh.nix
    ../modules/programs/postgresql.nix
    ../modules/programs/nvim/nvim.nix
    ../modules/desktops/gnome.nix
  ];

  fileSystems = {
    "/" = {
      device = "/dev/disk/by-label/NIXOS_SD";
      fsType = "ext4";
      options = [ "noatime" ];
    };
  };

  # networking = {
  #   hostName = hostname;
  #   wireless = {
  #     enable = true;
  #     networks."${SSID}".psk = SSIDpassword;
  #     interfaces = [ interface ];
  #   };
  # };

  environment.systemPackages = with pkgs; [ vscode ];

  services.openssh.enable = true;

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
    hardware.raspberry-pi."4".fkms-3d.enable = true;

    # services.xserver = {
    #   enable = true;
    #   displayManager.lightdm.enable = true;
    #   desktopManager.xfce.enable = true;
    # };

    hardware.pulseaudio = {
      enable = true;
      support32Bit = true;
    # extraModules = with pkgs; [ pulseaudio-modules-bt ];
    package = pkgs.pulseaudioFull;
    extraConfig = ''
        load-module module-switch-on-connect
    '';
  };

  # nixpkgs.config.allowUnfree = true;

}
