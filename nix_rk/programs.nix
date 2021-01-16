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

                        # cad
                        librecad

                        # www
                        firefox
                        brave
                        
                        # cd burner
                        brasero

                        # office
                        libreoffice

                        # video conference
                        #zoom-us
                        teams
                        skype

                        # games
                        

                        firmwareLinuxNonfree
                        microcodeIntel

                        wget
                        curl
                        git
                        rsync
                        tree
                        
                        # media
                        vlc
                        libdvdcss # plugin to play cd/dvd in mpv

                        
                        psutils

                        (python37.withPackages(ps: with ps;
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
