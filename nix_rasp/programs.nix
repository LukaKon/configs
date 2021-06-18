{ config, pkgs, ... }:

{
  environment = {
    systemPackages = with pkgs;
    [
      nix

      doas
      tree
      pstree  # process tree
      wget
      curl
      git
      rsync

      bat
      fd

      nodejs

      # monitoring
      bmon
      htop
      # nvtop
      # iotop
      lm_sensors
      # ncdu # disk analisys
      # sysstat

      # terminal
      alacritty
      # xterm

      # text editor
      neovim
      # ueberzug
      fzf
      xsel  # for copying
      clipmenu  # for copying

      # packer
      # unzip
      # unar
      xarchiver
      p7zip

      # file managers
      vifm-full
      # pcmanfm
      # ranger

      # IDE
      # vscode
      # thonny

      # wordpress

      # LaTeX
      # texlive.combined.scheme-full
      # texstudio

      # graphics
      # blender
      darktable
      gimp
      krita

      # cad
      # librecad

      # www
      # firefox
      # geckodriver
      qutebrowser
      # brave
      # tor-browser-bundle-bin

      # comunicator
      # signal-desktop
      # slack

      # video conference
      # zoom-us

      # snipping tool
      # shutter

      # office
      libreoffice

      # media
      #  feh # picture viewer
      # mpv # video player
      # libdvdcss # plugin to play cd/dvd in mpv
      #  moc  # music player
      # youtube-dl

      # psutils
      # pciutils
      # gputils

      (python39.withPackages(ps: with ps;
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
          # ipython
          bpython
          # pylint
          # jupyter
        ]))
      ];
    };
  }
