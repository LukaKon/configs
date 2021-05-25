{config, pkgs, ...}:

{
    environment.systemPackages = with pkgs;
                [remmina];

    services.xrdp.enable = true;
    # services.xrdp.defaultWindowManager = "${pkgs.openbox}/bin/openbox";
    # services.xrdp.defaultWindowManager = "${pkgs.icewm}/bin/icewm";
    services.xrdp.defaultWindowManager = "mate-session";
    networking.firewall.allowedTCPPorts = [ 3389 ];
}