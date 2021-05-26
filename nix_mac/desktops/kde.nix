
{config, lib, ...}:

{
	services.xserver = {
                        enable = true;
                        videoDrivers = ["modesetting"]; #["nouveau"];
                        # displayManager.startx.enable = true;  # necessary to
                        # create .xinitrc file

                        # Mate
                        displayManager.sddm.enable = true;
                        desktopManager.plasma5.enable = true;

                        layout = "pl";
                      };
}
