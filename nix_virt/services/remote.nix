{config, pkgs, ...}:

{
    services.xrdp.enable = true;
    services.xrdp.defaultWindowManager = "${pkgs.icewm}/bin/icewm";
    networking.firewall.allowedTCPPorts = [ 3389 ];
}
