{ config, pkgs, ... }:

{
  users.users.lk = {
    isNormalUser = true;
    home = "/home/lk";
    description = "lko";
    extraGroups = [ "wheel" "networkmanager" "dialout" "libvirtd" "docker"];
    shell = pkgs.zsh;
    packages = with pkgs;
    [
      exercism
    ];
  };
}
