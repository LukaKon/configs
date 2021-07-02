{config, pkgs, lib, ...}:

{
  services.xserver = {
    enable = true;
    videoDrivers = ["modesetting"]; #["nouveau"];
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;

    layout = "pl";
  };
  environment.systemPackages = with pkgs;
  [
    gnome3.adwaita-icon-theme
    gnome-breeze
    gnomeExtensions.sound-output-device-chooser
    gnomeExtensions.tilingnome
    gnomeExtensions.paperwm
    dconf2nix
  ];
  services.udev.packages = with pkgs;
  [
    gnome3.gnome-settings-daemon
    gnome3.seahorse
    gnome3.gnome-keyring
    gnome3.gnome-desktop
    gnome3.gnome-applets
    gnome3.gnome-tweak-tool
    gnome3.dconf-editor
    gnome3.gnome-color-manager
    gnome3.gnome-control-center
  ];
  environment.gnome.excludePackages = with pkgs;
  [
    gnome3.totem
    gnome3.geary
    gnome3.cheese
    gnome3.gnome-maps
    gnome3.simple-scan
    gnome3.gnome-music
    gnome3.gnome-contacts
    gnome3.gnome-calendar
    gnome3.gnome-terminal
    gnome3.gnome-bluetooth
    gnome3.gnome-system-monitor
  ];
}
