{ config, pkgs, ... }:

{
  users.users.kk = {
    isNormalUser = true;
    home = "/home/kk";
    description = "kko";
    extraGroups = [ "wheel" "networkmanager" "dialout" "libvirtd" "docker"];
    shell = pkgs.zsh;
    packages = with pkgs;
    [
    ];
  };
}
