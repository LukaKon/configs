{ config, pkgs, ... }:

{
  environment = {
    systemPackages = with pkgs;
    [
      firmwareLinuxNonfree
      microcodeIntel

      psutils
      pciutils
      gputils

      git
      git-crypt
      gnupg # gpg
      # pinentry-gnome

      # terminal
      alacritty
      # foot

      # file managers
      vifm-full
      ranger
      fzf

      # IDE
      # neovim
      # spacevim
      # neovide
      # uivonim
      # vscode
      vscodium
      arduino
      # jetbrains.pycharm-community
      # jetbrains.pycharm-professional
      # thonny
      # unityhub
      dbeaver
      postman

      # LaTeX
      texlive.combined.scheme-full
      # texstudio
      # mindforger

      # graphics
      # blender
      darktable
      gimp
      krita

      # www
      firefox
      # geckodriver
      qutebrowser
      # vimb
      brave
      # tor-browser-bundle-bin
      # nyxt

      # comunicator
      # signal-desktop
      slack

      # video conference
      zoom-us

      # cd burner
      brasero
      # etcher
      # gparted

      # office
      libreoffice

      # media
      feh # picture viewer
      # mpv # video player
      # libdvdcss # plugin to play cd/dvd in mpv
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
      # bmake

      # monitoring
      # bmon
      # htop
      # iotop
      glances
      lm_sensors
      # ncdu # disk analisys
      sysstat

      # ueberzug
      xsel  # for copying
      clipmenu  # for copying

      (python39.withPackages(ps: with ps;
      [
        # autopep8
        # flake8
        colorama
        psutil
        pip
        pynvim
        yapf
        jedi
        # bpython
        ptpython
        pylint
        # jupyter
      ]))
    ];
  };
}
