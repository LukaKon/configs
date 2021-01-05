{config, lib, ...}:

{
	services.xserver = {
                        enable = true;
                        videoDrivers = ["nouveau"];
                        # displayManager.startx.enable = true;  # necessary to
                        # create .xinitrc file
                    

                        # Plasma
                        displayManager.sddm.enable = true;
                        displayManager.sddm.autoNumlock = true;
                        desktopManager.lxqt.enable = true;

                        
                        layout = "pl";
                      };
  environment.lxqt.excludePackages = [];
}