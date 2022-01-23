{ config, pkgs, ... }:

{
  users.users.kk = {
    isNormalUser = true;
    home = "/home/kk";
    description = "kko";
    extraGroups = [ "wheel" "networkmanager" "libvirtd" "docker"];
    shell = pkgs.zsh;
    packages = with pkgs;
    [
    ];
  };
}
