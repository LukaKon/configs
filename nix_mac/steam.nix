{config, pkgs, ...}:

{
	hardware = {
		pulseaudio.support32Bit = true;
                opengl.driSupport32Bit = true;
	};

	environment = {systemPackages = with pkgs; [steam];};

}
