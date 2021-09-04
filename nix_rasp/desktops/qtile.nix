{config, lib, ...}:

{
	services.xserver = {
		enable = true;
		# videoDrivers = ["modesetting" "nvidia"];
		# displayManager.startx.enable = true;  # necessary to
		# create .xinitrc file

		# Qtile
		displayManager.lightdm.enable = true;
		windowManager.qtile.enable = true;
		displayManager.defaultSession = "none+qtile";

		layout = "pl";
	};
    nixpkgs = {
		overlays = [
			(self: super: {
				qtile = super.qtile.overrideAttrs(oldAttrs: {
					pythonPath = oldAttrs.pythonPath ++ (with self.python39Packages; [
					keyring
					xcffib
					#cairocffi-xcffib
					setuptools
					setuptools_scm
					dateutil
					dbus-python
					mpd2
					psutil
					pyxdg
					pygobject3
				]);
			});
		})];
	};
}
