{config, pkgs, ...}:

{
    services.xrdp.enable = true;
    services.xrdp.defaultWindowManager = "${pkgs.openbox}/bin/openbox";
    networking.firewall.allowedTCPPorts = [ 3389 ];
}
