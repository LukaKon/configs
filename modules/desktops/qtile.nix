{ config, lib, ... }:

{
  services.xserver = {
    enable = true;
    # videoDrivers = ["modesetting" "nvidia"];
    # displayManager.startx.enable = true;  # necessary to
    # create .xinitrc file

    # Qtile
    displayManager.lightdm.enable = true;
    # displayManager.gdm.wayland.enable = true;
    windowManager.qtile.enable = true;
    displayManager.defaultSession = "none+qtile";

    layout = "pl";
  };

  environment = {
    systemPackages = with pkgs;
      [
        rofi
      ];
  };
}
