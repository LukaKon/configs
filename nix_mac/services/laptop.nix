{config, lib, pkgs, ...}:

{
    services.xserver.libinput = {
                                    enable = true;
                                    tapping = true;
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