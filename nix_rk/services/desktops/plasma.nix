{config, lib, ...}:

{
	services.xserver = {
                        enable = true;
                        videoDrivers = ["modesetting" "nvidia"];
                        # displayManager.startx.enable = true;  # necessary to
                        # create .xinitrc file
                    

                        # Plasma
                        #displayManager.sddm.enable = true;
                        #displayManager.sddm.autoNumlock = true;
                        desktopManager.plasma5.enable = true;

                        
                        layout = "pl";
                      };
}
