{config, ... }:

{
    services.nginx.enable = true;
    services.nginx.virtualHosts."luka.org" = {
                #addSSL = true;
                #enableACME = true;
                # forceSSL=true;
                root = "/var/www/luka.org";
                };

                #security.acme = {
                #    acceptTerms = true;
                #    certs = {"luka.org".email = "lukasz.konieczny.lk@gmail.com";};
                #};
}

