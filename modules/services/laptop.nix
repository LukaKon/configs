{config, lib, pkgs, ...}:

{
  services.xserver.libinput = {
    enable = true;
    touchpad.tapping = true;
  };

  environment = {
    systemPackages = with pkgs;
    [
      acpi #laptop
      xorg.xbacklight
    ];
  };
}
