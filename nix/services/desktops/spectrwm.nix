{config, lib, pkgs, ...}:

{
	services.xserver = {
                        enable = true;
                        videoDrivers = ["modesetting" "nvidia"];
                        # displayManager.startx.enable = true;  # necessary to
                        # create .xinitrc file
                    

                        # Spectrwm
                        displayManager.lightdm.enable = true;
                        windowManager.spectrwm.enable = true;
                        #displayManager.defaultSession = "spectrwm";

                        layout = "pl";
                      };
                      environment = {
                        systemPackages = with pkgs;
                        [
                          dmenu
                          xlockmore
                        ];
                      };
}
