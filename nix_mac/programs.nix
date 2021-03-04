{ config, pkgs, ... }:

{
    environment = {
                    systemPackages = with pkgs;
                    [
                        doas

                        nix

                        # monitoring
                        bmon
                        htop
                        nvtop
                        iotop
                        lm_sensors

                        # terminal
                        termite
                        # alacritty

                        neovim
                        #zsh
                        # fzf
                        xsel  # for copying
                        clipmenu  # for copying
                        vifm-full

                        pciutils
                        
                        unzip
                        unar
                        xarchiver

                        # graphics
                        # darktable
                        # gimp
                        # krita
                        # gnome-photos

                        # cad
                        # librecad

                        # www
                        firefox
                        geckodriver
                        qutebrowser
                        # tor-browser-bundle-bin
                        brave

                        # cdburner
                        brasero

                        # office
                        # libreoffice

                        # video conference
                        zoom-us
                        # teams
                        skype

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

                        (python38.withPackages(ps: with ps;
                        [
                            autopep8
                            flake8
                            colorama
                            psutil
                            pip
                            pynvim
                            yapf
                            jedi
                            termcolor
                            ipython
                        ]))

                        # games
                        # widelands
                    ];
	};
}
