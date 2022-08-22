{ config, pkgs, ... }:
{
  containers.test = {
    # system.stateVersion = "22.05";
    ephemeral = true;
    autoStart = true;
    config = { config, pkgs, ... }: {
      services.nginx = {
        enable = true;
        config = pkgs.lib.readFile /home/lk/dev/party_wizard/PARTY/nginx/nginx.conf;
      };
      networking.firewall.allowedTCPPorts = [ 80 ];
    };

    # bindMounts = {
    #   "/var/log/httpd" = {
    #     hostPath = "/mnt/testContainerData/";
    #     isReadOnly = false;
    #   };
    # };

    # privateNetwork = true;
    # hostAddress = "192.168.0.4";
    # localAddress = "192.168.0.50";
  };
}
