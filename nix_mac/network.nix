{config, ...}:

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
	  	  hostName = "mac"; # Define your hostname.
	  	  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
	  	  networkmanager.enable = true;
		};
}
