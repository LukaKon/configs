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
        firefox
        freetube
        libreoffice
        gimp
        krita
        mypaint
        libsForQt5.kolourpaint
        flameshot
      ];
  };
}
