{config, lib, pkgs, ...}:

{
	services = {
				xserver = {
							enable = true;

							videoDrivers = ["modesetting" "nvidia"];
							# displayManager.startx.enable = true;  # necessary to
							# create .xinitrc file

							# i3
							
							displayManager.lightdm.enable = true;
							displayManager.defaultSession = "none+i3";
							
							desktopManager.xterm.enable = false;
							
							windowManager.i3 = {
											enable = true;
											# package = pkgs.i3-gaps;
											configFile = ./i3.conf;
											extraPackages = with pkgs; [
											dmenu
											i3status
											i3lock
											# i3blocks
											];
							};
							
						layout = "pl";
						};

				autorandr.enable = true;
			};
}

