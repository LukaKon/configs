{config, pkgs, lib, ...}:

{
    # imports = [ ./services/desktops/gnome/dconf.nix ];
    # imports = [ ./dconf.nix ];

    # hardware.nvidia.modesetting.enable = true;

    services.xserver = {
      enable = true;
      # videoDrivers = ["nvidia"];
      # displayManager.startx.enable = true;  # necessary to
      # create .xinitrc file

      # Gnome
      displayManager.gdm.enable = true;
      # displayManager.gdm.nvidiaWayland = true;
      # displayManager.gdm.wayland = true;
      displayManager.gdm.wayland = false;
      desktopManager.gnome.enable = true;

      layout = "pl";
    };
    environment.systemPackages = with pkgs;
    [
      gnome3.adwaita-icon-theme
      # gnomeExtensions.arc-menu
      # gnomeExtensions.icon-hider  # broken
      gnomeExtensions.sound-output-device-chooser
      # gnomeExtensions.tilingnome
      gnomeExtensions.gtile # Tile windows on a grid.
      gnomeExtensions.wintile-windows-10-window-tiling-for-gnome
      gnomeExtensions.windownavigator
      gnomeExtensions.just-perfection
      gnomeExtensions.tweaks-in-system-menu
      gnomeExtensions.workspace-matrix
      gnomeExtensions.workspace-switch-wraparound
      gnomeExtensions.vitals
      gnomeExtensions.freon   # GNOME Shell extension for displaying CPU, GPU, disk temperatures, voltage and fan RPM in the top panel
      # gnomeExtensions.ddterm
      gnome.gnome-tweaks
      gnome-breeze


      dconf2nix
      brasero
      # firefox-wayland
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
      gnome.gnome-terminal
    ];

  }
