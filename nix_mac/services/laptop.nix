{config, lib, pkgs, ...}:

{
    services.xserver.libinput = {
                                    enable = true;
                                    touchpad.tapping = true;
                                };
    environment = {
                    systemPackages = with pkgs;
                    [
                        #laptop
                        acpi
                        xorg.xbacklight
                    ];
    };
}
