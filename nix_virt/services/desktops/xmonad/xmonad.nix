# Configuration for my xmonad desktop requirements

{ config, pkgs, ... }:

{

    services = {
        xserver = {
            enable = true;                        # Enable the X11 windowing system.
            desktopManager.xterm.enable = false;

            # displayManager.lightdm.enable = true;
            displayManager.defaultSession = "none+xmonad";
            windowManager = {                     # Open configuration for the window manager.
                xmonad = {
                    enable = true;                                # Enable xmonad.
                    config = ./config.hs;
                    # haskellPackages = [];
                    enableContribAndExtras = true;                # Enable xmonad contrib and extras.
                    extraPackages = hp: [                      # Open configuration for additional Haskell packages.
                        # hp.dbus
                        hp.monad-logger
                        hp.xmonad-contrib                               # Install xmonad-contrib.
                        hp.xmonad-extras                                # Install xmonad-extras.
                        hp.xmonad                                       # Install xmonad itself.
                    ];
                    # default = "xmonad";                                  # Set xmonad as the default window manager.
                    };
                };

        };
    #   services.xserver.libinput.enable = true;               # Enable touchpad support.

        udisks2.enable = true;                        # Enable udisks2.
        devmon.enable = true;                         # Enable external device automounting.
    };


    # Install other packages that I require to be used with xmonad.
      environment.systemPackages = with pkgs; [
        dmenu                    # A menu for use with xmonad
        # feh                      # A light-weight image viewer to set backgrounds
        haskellPackages.libmpd   # Shows MPD status in xmobar
        haskellPackages.xmobar   # A Minimalistic Text Based Status Bar
        # libnotify                # Notification client for my Xmonad setup
        # lxqt.lxqt-notificationd  # The notify daemon itself
        # mpc_cli                  # CLI for MPD, called from xmonad
        # scrot                    # CLI screen capture utility
        # trayer                   # A system tray for use with xmonad
        # xbrightness              # X11 brigthness and gamma software control
        # xcompmgr                 # X composting manager
        # xorg.xrandr              # CLI to X11 RandR extension
    #     xscreensaver             # My preferred screensaver
    #     xsettingsd               # A lightweight desktop settings server
      ];

    }