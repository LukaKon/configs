
{config, lib, pkgs, ...}:

{
	services = {
				xserver = {
							enable = true;

							displayManager.lightdm.enable = true;
							displayManager.defaultSession = "none+spectrwm";

							desktopManager.xterm.enable = false;

							windowManager.spectrwm = {
											enable = true;
							};

							layout = "pl";
						};

				autorandr.enable = true;
			};
	environment = {
                    systemPackages = with pkgs; [
						xlockmore
						dmenu
					];

				};
}