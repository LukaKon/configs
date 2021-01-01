# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./environment.nix
      ./hdd.nix
      ./nixpkgs.nix
      ./users.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot = {
	  	loader.systemd-boot.enable = true;
	  	loader.efi.canTouchEfiVariables = true;
      };

  system = {
          autoUpgrade = {
          enable = true;
          #allowReboot = true;
        };

  };
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

  # Set your time zone.
  time.timeZone = "Europe/Warsaw";

  # The global useDHCP flag is deprecated, therefore explicitly set to false here.
  # Per-interface useDHCP will be mandatory in the future, so this generated config
  # replicates the default behaviour.
  # networking.useDHCP = false;
  # networking.interfaces.enp0s31f6.useDHCP = true;
  # networking.interfaces.wlp1s0.useDHCP = true;

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  i18n = {
	   defaultLocale = "pl_PL.UTF-8";
	   supportedLocales = ["pl_PL.UTF-8/UTF-8" "en_US.UTF-8/UTF-8"];
	 };

  console = {
		font = "firacode-14"; #"Lat2-Terminus16";
		keyMap = "pl";
	    };


  # Enable sound.
  sound.enable = true;
  hardware = {
                pulseaudio.enable = true;

                # for Steam
                pulseaudio.support32Bit = true;
                opengl.driSupport32Bit = true;
              };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  programs = {
		gnupg.agent = {enable = true; enableSSHSupport = true;};
		vim = {
			    defaultEditor = true;
            };
        npm = {
                enable = true;
            };
		zsh = {
			    enable = true;
                enableCompletion = true;
                autosuggestions.enable = true;
                syntaxHighlighting.enable = true;
                histFile = "$HOME/.config/zsh/.zsh_history";
                histSize = 10000;
                setOptions = [
                              # | NAVIGATION |
                              "AUTO_CD"			            # Go to folder path without using cd.
                              "AUTO_PUSHD"			        # Push the old directory onto the stack on cd.
                              "PUSHD_IGNORE_DUPS"		    # Do not store duplicates in the stack.
                              "PUSHD_SILENT"			    # Do not print the directory stack after pushd or popd.
                              "CORRECT"			            # Spelling correction
                              "CDABLE_VARS"			        # Change directory to a path stored in a variable.
                              "EXTENDED_GLOB"		        # Use extended globbing syntax.
                              # | HISTORY |
                              "EXTENDED_HISTORY"          	# Write the history file in the ':start:elapsed;command' format.
                              "SHARE_HISTORY"             	# Share history between all sessions.
                              "HIST_EXPIRE_DUPS_FIRST"    	# Expire a duplicate event first when trimming history.
                              "HIST_IGNORE_DUPS"            # Do not record an event that was just recorded again.
                              "HIST_IGNORE_ALL_DUPS"      	# Delete an old recorded event if a new event is a duplicate.
                              "HIST_FIND_NO_DUPS"         	# Do not display a previously found event.
                              "HIST_IGNORE_SPACE"         	# Do not record an event starting with a space.
                              "HIST_SAVE_NO_DUPS"         	# Do not write a duplicate event to the history file.
                              "HIST_VERIFY"               	# Do not execute immediately upon history expansion.

                          ];

    ohMyZsh = {
                enable = true;
                plugins = ["python" "colorize"];
                theme = "strug";	# jonathan
                #package = "pkgs.oh-my-zsh";
              };
    };
      seahorse.enable = true; # for gnome-keyring gui application
      dconf.enable = true;  # for gnome applications
	};
  
  fonts = {
      fonts = with pkgs; [
                          inconsolata
                          fira-code
                          fira-code-symbols
                          ubuntu_font_family
                          corefonts
                          noto-fonts-emoji
                          joypixels
                          nerdfonts
                        ];
	fontconfig={
                defaultFonts={
                              monospace=["Fira Code"];
                              emoji = ["Joypixels"];
			};
		};
	};

  # List services that you want to enable:

  services = {
              openssh = {
                          enable = true;
                      };
              xserver = {
                          enable = true;
                          videoDrivers = ["intel" "nvidia"];
                          # displayManager.startx.enable = true;  # necessary to
                          # create .xinitrc file
                          displayManager.lightdm.enable = true;
                          # desktopManager.plasma5.enable = true;
                          windowManager.qtile.enable = true;
                          displayManager.defaultSession = "none+qtile";
                          layout = "pl";
                      };
              gnome3.gnome-keyring.enable = true;
              postgresql = {
                            enable = true;
                            package = pkgs.postgresql_12;
                            enableTCPIP = true;
                            #dataDir = "/home/lk/postDB";
                            authentication = pkgs.lib.mkOverride 12 ''
                              local all all trust
                              host all all ::1/128 trust
                              host all all 192.168.0.0/24 trust
                            '';
                            initialScript = pkgs.writeText "backend-initScript" ''
                              CREATE ROLE lko WITH LOGIN PASSWORD 'Lukasz82' CREATEDB;
                            
                              CREATE DATABASE lko;
                              GRANT ALL PRIVILEGES ON DATABASE lko TO lko;
                            '';
                        };
        };
  security = {
              doas = {
                      enable = true;
                      wheelNeedsPassword = true;
                };
        #pam.services.lightdm.enable = true;  # TODO not working. for auto unlock keyring during
        #login
            
      };
  virtualisation = {
                    virtualbox.host = {
                      enable = true;
                      enableExtensionPack = true;
                  };
                  docker.enable = true;
                };
  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;


  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "20.09"; # Did you read the comment?


  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };
}

