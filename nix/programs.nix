{ config, pkgs, ... }:

{
    environment = {
                    systemPackages = with pkgs;
                    [
                        nix
                        # direnv

                        doas

                        # monitoring
                        bmon
                        htop
                        nvtop
                        iotop
                        lm_sensors

                        # terminal
                        #termite
                        alacritty

                        # vim
                        # neovim
                        # neovim-remote
                        #zsh
                        fzf
                        xsel  # for copying
                        clipmenu  # for copying
                        unzip

                        # file managers
                        vifm-full
                        pcmanfm

                        # graphics
                        blender
                        darktable
                        gimp
                        krita

                        # cad
                        # librecad

                        # www
                        firefox
                        geckodriver
                        qutebrowser
                        brave
                        # tor-browser-bundle-bin

                        # comunicator
                        signal-desktop
                        slack

                        # flameshot

                        # cd burner
                        #brasero

                        # video conference
                        zoom-us
                        teams
                        skype
                        remmina

                        # office
                        libreoffice

                        # games
                        openarena
                        widelands

                        firmwareLinuxNonfree
                        microcodeIntel

                        wget
                        curl
                        git
                        rsync
                        tree

                        nodejs

                        # media
                        feh # picture viewer
                        mpv # video player
                        libdvdcss # plugin to play cd/dvd in mpv
                        moc  # music player

                        psutils
                        pciutils

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
                        ]))
                    ];
    };
}
