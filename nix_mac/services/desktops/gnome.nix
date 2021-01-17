{config, pkgs, lib, ...}:

{
	services.xserver = {
                        enable = true;
                        videoDrivers = ["nouveau"];
                        # displayManager.startx.enable = true;  # necessary to
                        # create .xinitrc file
                    

                        # Gnome
                        displayManager.gdm.enable = true;
                        desktopManager.gnome3.enable = true;
                        
                        layout = "pl";
                      };
    environment.systemPackages = [ 
        # gnome3.adwaita-icon-theme
        # gnome-shell-extension-appindicator-32
        ];
    services.udev.packages = with pkgs; [ gnome3.gnome-settings-daemon ];
    environment.gnome3.excludePackages = [ pkgs.gnome3.totem ];
}