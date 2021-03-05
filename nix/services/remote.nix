{config, pkgs, ...}:

{
    environment.systemPackages = with pkgs;
                [remmina];

    services.xrdp.enable = true;
    services.xrdp.defaultWindowManager = "${pkgs.icewm}/bin/icewm";
    networking.firewall.allowedTCPPorts = [ 3389 ];
}