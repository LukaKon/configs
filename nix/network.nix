{config, ...}:

{
	networking = {
                  hostName = "fuji"; # Define your hostname.
                  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
                  networkmanager.enable = true;

          	interfaces.wlp1s0.ipv4.addresses = [{
                  address = "192.168.0.3";
                  prefixLength = 24;
                }];

          	defaultGateway = "192.168.0.1";
          	nameservers = ["37.8.214.2" "31.11.202.254"];
        };
}
