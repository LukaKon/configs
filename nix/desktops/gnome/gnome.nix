{config, pkgs, lib, ...}:

{
    # imports = [ ./services/desktops/gnome/dconf.nix ];
    # imports = [ ./dconf.nix ];

    # hardware.nvidia.modesetting.enable = true;

    services.xserver = {
      enable = true;
      videoDrivers = ["nvidia"];
      # displayManager.startx.enable = true;  # necessary to
      # create .xinitrc file

      # Gnome
      displayManager.gdm.enable = true;
      # displayManager.gdm.nvidiaWayland = true;
      displayManager.gdm.wayland = false;
      desktopManager.gnome.enable = true;

      layout = "pl";
    };
    environment.systemPackages = with pkgs;
    [
      gnome3.adwaita-icon-theme
      # gnome-shell-extension-appindicator-32
      # gnomeExtensions.arc-menu
      # gnomeExtensions.icon-hider  # broken
      gnomeExtensions.sound-output-device-chooser
      gnomeExtensions.tilingnome
      # gnomeExtensions.gnome-shell-extension-just-perfection
      gnomeExtensions.just-perfection
      # gnomeExtensions.gnome-shell-extension-tweaks-in-system-menu
      gnomeExtensions.tweaks-in-system-menu
      # gnomeExtensions.gnome-shell-extension-ddterm
      gnomeExtensions.ddterm
      gnome.gnome-tweaks
      gnome-breeze

      dconf2nix
      brasero
      # etcher
      # kitty
    ];
    services = {
      udev.packages = with pkgs;
      [
        gnome3.gnome-settings-daemon
        gnome3.seahorse
        gnome3.gnome-keyring
        gnome3.gnome-desktop
        gnome3.gnome-applets
        gnome3.gnome-tweak-tool
      ];
      dbus.packages = with pkgs;
      [
        gnome3.dconf
      ];
    };
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
    ];

  }
