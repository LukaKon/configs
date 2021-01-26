{ config, pkgs, ... }:

{
    environment = {
                    systemPackages = with pkgs;
                    [
                        nix

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
                        neovim-remote
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

                        # cad
                        librecad

                        # www
                        firefox
                        geckodriver
                        qutebrowser
                        brave
                        tor-browser-bundle-bin

                        # comunicator
                        signal-desktop

                        # cd burner
                        #brasero

                        # office
                        libreoffice

                        # video conference
                        #zoom-us
                        teams
                        skype

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
