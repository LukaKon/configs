{ config, pkgs, ... }:

{
    environment = {
                    systemPackages = with pkgs;
                    [
                        nix

                        # monitoring
                        bmon
                        htop
                        nvtop
                        iotop
                        lm_sensors

                        # terminal
                        #termite
                        alacritty

                        vim
			neovim
                        #zsh
                        fzf
                        xsel  # for copying
                        clipmenu  # for copying
                        mc
                        pciutils
                        unzip

                        # graphics
                        blender
                        darktable
                        gimp
                        krita

                        # www
                        firefox
                        geckodriver

                        # office
                        libreoffice

                        # video conference
                        #zoom-us
                        teams
                        skype

                        gnome3.gnome-keyring
                        gnome3.seahorse

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
                        moc  # music player
                        
                        psutils

                        python37Packages.pip
                    # python37Packages.autopep8
                    # python37Packages.flake8
                    # python37Packages.colorama
                        
                        ###

                        doas
                ];
	};
}
