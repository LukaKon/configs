{config, lib, ...}:

{
	services.xserver = {
                        enable = true;
                        # videoDrivers = ["nouveau"];
                        # displayManager.startx.enable = true;  # necessary to
                        # create .xinitrc file

                        # Mate
                        displayManager.lightdm.enable = true;
                        desktopManager.mate.enable = true;

                        layout = "pl";
                      };
	environment.mate.excludePackages = [];
}
