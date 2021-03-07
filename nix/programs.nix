{ config, pkgs, ... }:

{
    environment = {
                    systemPackages = with pkgs;
                    [
                        nix
                        # direnv

                        doas
                        tree
                        pstree  # process tree
                        wget
                        curl
                        git
                        rsync

                        nodejs

                        # monitoring
                        bmon
                        htop
                        nvtop
                        iotop
                        lm_sensors
                        ncdu # disk analisys

                        # terminal
                        #termite
                        alacritty

                        # text editor
                        neovim
                        # ranger
                        # ueberzug
                        fzf
                        xsel  # for copying
                        clipmenu  # for copying

                        # packer
                        unzip
                        unar
                        xarchiver

                        # file managers
                        vifm-full
                        pcmanfm

                        # IDE
                        vscode
                        arduino
                        jetbrains.pycharm-community
                        # jetbrains.pycharm-professional
                        #monodevelop
                        thonny

                        wordpress

                        # LaTeX
                        texlive.combined.scheme-full
                        texstudio

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

                        # cd burner
                        #brasero

                        # snipping tool
                        shutter

                        # video conference
                        zoom-us
                        # teams
                        skype

                        # office
                        libreoffice

                        # games
                        openarena
                        widelands

                        firmwareLinuxNonfree
                        microcodeIntel


                        # media
                        feh # picture viewer
                        mpv # video player
                        libdvdcss # plugin to play cd/dvd in mpv
                        moc  # music player

                        psutils
                        pciutils
                        gputils

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
                    ];
    };
}
