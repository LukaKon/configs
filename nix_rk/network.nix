{config, ...}:

{
  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;

  networking = {
                  hostName = "via"; # Define your hostname.
                  
                  networkmanager.enable = true;
                  
                  #useDHCP = false;
  		  #interfaces.enp2s0.useDHCP = true;               
      };
}
