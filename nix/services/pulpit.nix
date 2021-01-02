{config, ...}:

{
	services.xserver = {
                          enable = true;
                          videoDrivers = ["modesetting" "nvidia"];
                          # displayManager.startx.enable = true;  # necessary to
                          # create .xinitrc file
                          displayManager.lightdm.enable = true;
                          # desktopManager.plasma5.enable = true;
                          windowManager.qtile.enable = true;
                          displayManager.defaultSession = "none+qtile";
                          layout = "pl";
                      };
}
