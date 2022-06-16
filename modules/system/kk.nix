{ config, pkgs, ... }:

{
  users.users.kk = {
    isNormalUser = true;
    home = "/home/kk";
    description = "kko";
    extraGroups = [ "wheel" "networkmanager" ];
    shell = pkgs.zsh;
    packages = with pkgs;
      [
        gimp
        krita
        mypaint
      ];
  };
}
