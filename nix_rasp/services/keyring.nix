{config, pkgs, ...}:

# keyring for non GNOME desktop

{
	environment = {
						systemPackages = with pkgs;
						[
							gnome3.gnome-keyring
							gnome3.seahorse
						];
					};

	services.gnome.gnome-keyring.enable = true;
	security.pam.services.gdm.enableGnomeKeyring = true;

	programs = {
					seahorse.enable = true; # for gnome-keyring gui application
					dconf.enable = true;  # for gnome applications
					gnupg.agent = {enable = true; enableSSHSupport = true;};
				};
}
