{ config, pkgs, lib, ... }:

{
  services.flatpak.enable = true;

  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-kde ];
  #xdg.portal.extraPortals = [];
}
