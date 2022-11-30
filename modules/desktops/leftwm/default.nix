{ config, lib, pkgs, ... }:

{
  services.xserver = {
    enable = true;
    displayManager.lightdm.enable = true;
    # displayManager.sddm.enable = true;
    windowManager.leftwm.enable = true;
    displayManager.defaultSession = "none+leftwm";
    layout = "pl";
  };

  environment = {
    systemPackages = with pkgs;
      [
        rofi
        polybar
        picom

        # hyprland

        # wayland based window manager
        # river
        swaybg
        swaylock
        waybar
        fuzzel
        # dunst
      ];
  };
}
