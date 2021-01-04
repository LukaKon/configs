# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      #./hdd.nix
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
	  	  hostName = "mac"; # Define your hostname.
	  	  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
	  	  networkmanager.enable = true;
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
  hardware.pulseaudio.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users = {
	users.lk = {
                    isNormalUser = true;
                    home = "/home/lk";
                    description = "lko";
                    extraGroups = [ "wheel" "networkmanager" "dialout" "docker"]; 
                    shell = pkgs.zsh;
			packages = with pkgs;
                                [
                                  exercism

                                  # IDE
                                  vscode
                                  #vscodium
                                  arduino
                                  #kdevelop
                                  #kdev-python
                                  jetbrains.pycharm-community
                                  #monodevelop

                                  # LaTeX
                                  #texlive.combined.scheme-full 
                                  #texstudio
                                  
                                  # snipping screen
                                  #flameshot  - not working

                                  # docker
                                  docker-compose

                                                                    
                                  # dotnet
                                  #mono
                                  dotnet-sdk_3
                                  #dotnetCorePackages.sdk_3_0
                                  #dotnetCorePackages.netcore_3_1

                                ];
		};
	users.kk = {
                    isNormalUser = true;
                    home = "/home/kk";
                    description = "krop";
                    extraGroups = [ "wheel" "networkmanager"]; 
                    shell = pkgs.zsh;
			packages = with pkgs;
                                [];
		};

		};

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment={
                systemPackages = with pkgs;
                                           [
                                            # monitoring
                                            bmon
                                            htop
                                            iotop
                                            lm_sensors

                                            #laptop
                                            acpi
                                            xorg.xbacklight

                                            # terminal
                                            termite
					
					nix

					  # text editor
					  neovim
					  ranger
					  ueberzug
					  
					  #gnome3.gnome-keyring
					  #gnome3.seahorse

                                            vim
                                            zsh
                                            fzf
                                            xsel  # for copying
                                            clipmenu  # for copying
                                            mc
                                            pciutils
                                            unzip
                                            
                                            #snapper # for managing btrfs snapshots
					# video conference
					#zoom-us
					  teams
					  #skype

					  # graphics
					  darktable
					  gimp
					  krita
					
                                            firefox
                                            geckodriver

                                            firmwareLinuxNonfree
                                            microcodeIntel

                                            wget
                                            curl
                                            git
                                            rsync
                                            tree
                                            
                                            # media
                                            feh # picture viewer
                                            mpv # video player
                                            libdvdcss # plugin to play cd/dvd in mpv
                                            
                                            #python37Packages [
                                            #  pip
                                            #  autopep8
                                            #  flake8
                                            #  colorama
                                            #  pyls-black
                                            #]
                                            python37Packages.pip
                                            python37Packages.autopep8
                                            python37Packages.flake8
                                            python37Packages.pyls-black
                                            python37Packages.colorama

                                            ###
                                            doas
                                        ];
		variables = {
                      EDITOR = "nvim";
                      VISUAL = "nvim";
                  };
    shellAliases = {
                    # git
                    gs = "git status";
                    ga = "git add";
                    gc = "git commit";
                    gp = "git push";
                    
                    # term
                    susp = "systemctl suspend";
                    reboot = "doas reboot";

                    # nix
                    up = "sudo nix-channel --update && nix-env -u";
                    rebuild = "sudo nixos-rebuild switch";

                    # btrfs snapshots
                    sb = "python /home/lk/scripts/snapshot.py";
                };
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
      #seahorse.enable = true; # for gnome-keyring gui application
      #dconf.enable = true;  # for gnome applications
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
                          terminus_font
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
			  libinput = {
					enable = true;
					tapping = true;
				};
                          videoDrivers = ["nouveau"];
                          # displayManager.startx.enable = true;  # necessary to
                          # create .xinitrc file
                          #displayManager.lightdm.enable = true;
                          windowManager.qtile.enable = true;
                          #displayManager.defaultSession = "none+qtile";

			#displayManager.sddm.enable = true;
			#displayManager.sddm.autoNumlock = true;
                        #  desktopManager.plasma5.enable = true;
                        #  displayManager.defaultSession = "plasma5";

			displayManager.gdm.enable = true;
                          desktopManager.gnome3.enable = true;
                          displayManager.defaultSession = "gnome";

                          #windowManager.spectrwm.enable = true;
                          layout = "pl";
                      };
             # gnome3.gnome-keyring.enable = true;
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
                  	docker.enable = true;
                };
  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  nixpkgs = {
              config={
                      allowUnfree = true;
                      # pulseaudio = true;
                      packageOverrides = pkgs: rec {
                      neovim = pkgs.neovim.override {
                                      vimAlias = true;
                                      withPython = true;
                                      configure = {
                                              packages.myVimPackage = with
                                              pkgs.vimPlugins;
                                              {
                                                  start = [
                                                            commentary
                                                            vim-airline-themes
                                                            vim-airline
                                                            fzf-vim
                                                            tabular
                                                            syntastic
                                                            vim-nix
                                                            neomake
                                                            neoformat
                                                            gitgutter
                                                            coc-python
                                                            "github:tomasr/molokai"
                                                            # Better Comments
                                                            "tpope/vim-commentary"
                                                            # Change dates fast
                                                            "tpope/vim-speeddating"
                                                            # Convert binary, hex, etc..
                                                            "glts/vim-radical"
                                                            # Repeat stuff
                                                            "tpope/vim-repeat"
                                                            # Text Navigation
                                                            "unblevable/quick-scope"
                                                            # highlight all matches under cursor
                                                            "RRethy/vim-illuminate"
                                                            # Better syntax support
                                                            "sheerun/vim-polyglot"
                                                            # Auto pairs for '(' '[' '{'
                                                            "jiangmiao/auto-pairs"
                                                            # Rainbow brackets
                                                            "luochen1990/rainbow"
                                                            # Start screen
                                                            "mhinz/vim-startify"
                                                            #"LnL7/vim-nix"
                                                          ];
                                          opt = [];
                                      };
                                      customRC = ''
                                          set tw=80

                                          set iskeyword+=-                     	" treat dash separated words as a word text object"
                                          set formatoptions-=cro                  " Stop newline continution of comments

                                          syntax enable                           " Enables syntax highlighing
                                          set hidden                              " Required to keep multiple buffers open multiple buffers
                                          set nowrap                              " Display long lines as just one line
                                          set whichwrap+=<,>,[,],h,l
                                          set encoding=utf-8                      " The encoding displayed
                                          set pumheight=10                        " Makes popup menu smaller
                                          set fileencoding=utf-8                  " The encoding written to file
                                          set ruler              			        " Show the cursor position all the time
                                          set cmdheight=2                         " More space for displaying messages
                                          set mouse=a                             " Enable your mouse
                                          set splitbelow                          " Horizontal splits will automatically be below
                                          set splitright                          " Vertical splits will automatically be to the right
                                          set t_Co=256                            " Support 256 colors
                                          set conceallevel=0                      " So that I can see `` in markdown files
                                          set tabstop=4                           " Insert 2 spaces for a tab
                                          set shiftwidth=4                        " Change the number of space characters inserted for indentation
                                          set smarttab                            " Makes tabbing smarter will realize you have 2 vs 4
                                          set expandtab                           " Converts tabs to spaces
                                          set smartindent                         " Makes indenting smart
                                          set autoindent                          " Good auto indent
                                          set laststatus=2                        " Always display the status line
                                          set number relativenumber               " Line numbers
                                          set cursorline                          " Enable highlighting of the current line
                                          set background=dark                     " tell vim what the background color looks like
                                          set showtabline=2                       " Always show tabs
                                          set nobackup                            " This is recommended by coc
                                          set nowritebackup                       " This is recommended by coc
                                          set shortmess+=c                        " Don't pass messages to |ins-completion-menu|.
                                          set signcolumn=yes                      " Always show the signcolumn, otherwise it would shift the text each time
                                          set updatetime=300                      " Faster completion
                                          set timeoutlen=100                      " By default timeoutlen is 1000 ms
                                          set clipboard=unnamedplus               " Copy paste between vim and everything else
                                          set incsearch
                                          set guifont=Fira\ Code\ Nerd\ Font
                                          '';
                                      #opt=[];
                                    };
                        };
                      };    
              };
              overlays = [
                          (self: super: {
                              qtile = super.qtile.overrideAttrs(oldAttrs: {
                              pythonPath = oldAttrs.pythonPath ++ (with self.python37Packages; [
                              keyring
                              xcffib
                              #cairocffi-xcffib
                              setuptools
                              setuptools_scm
                              dateutil
                              dbus-python
                              mpd2
                              psutil
                              pyxdg
                              pygobject3
                            ]);
                          });
                        })];
  };


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

