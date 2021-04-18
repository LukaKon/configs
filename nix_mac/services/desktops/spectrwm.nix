
{config, lib, pkgs, ...}:

{
	services = {
				xserver = {
							enable = true;

							videoDrivers = ["modesetting" "nvidia"];
							displayManager.startx.enable = true;  # necessary to
							# create .xinitrc file;


							displayManager.lightdm.enable = true;
							displayManager.defaultSession = "spectrwm";

							desktopManager.xterm.enable = false;

							windowManager.spectrwm = {
											enable = true;
							};

							layout = "pl";
						};

				autorandr.enable = true;
			};
	environment = {
                    systemPackages = with pkgs;
                    [xlockmore];
				};
}
