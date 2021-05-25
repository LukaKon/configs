{config, pkgs, ...}:

{
    environment.systemPackages = with pkgs;
                [remmina];

    services.xrdp.enable = true;
    # services.xrdp.defaultWindowManager = "${pkgs.openbox}/bin/openbox";
    # services.xrdp.defaultWindowManager = "${pkgs.icewm}/bin/icewm";
    services.xrdp.defaultWindowManager = "startmate-x11";
    # services.xrdp.defaultWindowManager = "startplasma-x11";
    networking.firewall.allowedTCPPorts = [ 3389 ];
}