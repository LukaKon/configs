{ config, ... }:

{
  # The global useDHCP flag is deprecated, therefore explicitly set to false here.
  # Per-interface useDHCP will be mandatory in the future, so this generated config
  # replicates the default behaviour.
  # networking.useDHCP = false;
  # networking.interfaces.enp0s31f6.useDHCP = true;
  # networking.interfaces.wlp1s0.useDHCP = true;


  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;

  networking = {
    hostName = "lap"; # Define your hostname.
    domain = "luka.lap.org";
    # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
    networkmanager.enable = true;

    # interfaces.wlp0s20f3.ipv4.addresses = [{
    # 		address = "192.168.0.4";
    # 		prefixLength = 24;
    # 	}];
    # interfaces.enp0s31f6.ipv4.addresses = [{
    # 		address = "192.168.1.4";
    # 		prefixLength = 24;
    # 	}];

    # defaultGateway = "192.168.0.1";
    #nameservers = ["37.8.214.2" "31.11.202.254"];
  };
}
