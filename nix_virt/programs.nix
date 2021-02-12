{ config, pkgs, ... }:

{
    environment = {
                    systemPackages = with pkgs;
                    [
                        nix
                        # direnv
                        
                        linuxPackages.virtualboxGuestAdditions

                        doas

                        # monitoring
                        bmon
                        htop
                        nvtop
                        iotop
                        lm_sensors

                        # terminal
                        termite

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

                        # www
                        qutebrowser

                        remmina

                        firmwareLinuxNonfree
                        microcodeIntel

                        wget
                        curl
                        git
                        rsync
                        tree

                        nodejs

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
