{ ... }:
{
  containers.test = {
    # system.stateVersion = "22.05";
    ephemeral = true;
    autoStart = true;
    config = { config, pkgs, ... }: {
      services.nginx = {
        enable = true;
        # config = ''
        # server {
          # listen 80 default_server;
        #   server_name localhost;
        
        #   location / {
        #     root /usr/share/nginx/html;
        #     index index.html index.htm;
        #   }
        # }
        # '';
        # virtualHosts = {
          # "partywizard.pl" = { };
        # };
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
