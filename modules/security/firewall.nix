{config, ...}:

{

	networking.firewall.allowedTCPPorts = [
                                            5432    # postgresql
                                            80
                                            443
                                            5900    # libvirt
                                        ];
  }
