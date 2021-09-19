{ config, pkgs, ... }:

{
  environment = {
    systemPackages = with pkgs;
    [
        git
        git-crypt
        gnupg # gpg
        pinentry-gnome

        # terminal
        # alacritty
        foot
        # wezterm

        # file managers
        vifm-full
        ranger

        # IDE
        # neovim-nightly
        # neovim
        # spacevim
        # neovide
        # uivonim
        # sublime3
        # vscode
        # vscodium
        # arduino
        # jetbrains.pycharm-community
        # jetbrains.pycharm-professional
        # thonny
        # unityhub

        # LaTeX
        texlive.combined.scheme-full
        # texstudio
        # mindforger

        # graphics
        # blender
        # darktable
        gimp
        krita

        # www
        firefox
        geckodriver
        qutebrowser
        # vimb
        # brave
        # tor-browser-bundle-bin
        # nyxt

        # snipping tool
        shutter

        # office
        libreoffice

        # media
        feh # picture viewer
        mpv # video player
        libdvdcss # plugin to play cd/dvd in mpv
        moc  # music player
        youtube-dl

        # packer
        unzip
        unar
        xarchiver
        p7zip

        nix-prefetch-git

        tree
        pstree  # process tree
        wget
        curl
        rsync
        bat # cat
        fd  # find

        nodejs

        # monitoring
        bmon
        htop
        iotop
        lm_sensors
        ncdu # disk analisys
        sysstat

        # ueberzug
        fzf
        xsel  # for copying
        clipmenu  # for copying

        # (python39.withPackages(ps: with ps;
        # [
        #     autopep8
        #     flake8
        #     colorama
        #     psutil
        #     pip
        #     pynvim
        #     yapf
        #     jedi
        #     termcolor
        #     bpython
        #     pylint
        #     jupyter
        # ]))
    ];
  };
}