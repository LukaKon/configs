{config, ...}:

{
	services.openssh = {
                            enable = true;
                            #passwordAuthentication = false; # don't need password
                            #authorizedKeysFiles = [
                            #  ""
                            #];
                      };
}
