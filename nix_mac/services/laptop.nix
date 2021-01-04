{config, lib, ...}:

{
    services.xserver.libinput = {
                                    enable = true;
                                    tapping = true;
                                };
}