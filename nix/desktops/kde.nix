
{config, lib, pkgs, ...}:

{
  services.xserver = {
    enable = true;
    videoDrivers = ["nvidia"]; #["nouveau"];
    # displayManager.startx.enable = true;  # necessary to
    # create .xinitrc file

    displayManager.sddm.enable = true;
    desktopManager.plasma5.enable = true;

    layout = "pl";
  };

  environment.systemPackages = with pkgs;
  [
    brasero
  ];

  services = {
      udev.packages = with pkgs;
      [
        gnome3.seahorse
        gnome3.gnome-keyring
      ];
  };
}
