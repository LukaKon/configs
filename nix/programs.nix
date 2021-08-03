{ config, pkgs, ... }:

{
  environment = {
    systemPackages = with pkgs;
    [
      nix-prefetch-git
      any-nix-shell

      doas
      tree
      pstree  # process tree
      wget
      curl
      git
      rsync
      bat # cat
      fd  # find

      nodejs

      # monitoring
      bmon
      htop
      nvtop
      iotop
      lm_sensors
      ncdu # disk analisys
      sysstat

      # terminal
      alacritty
      # foot

      # ueberzug
      fzf
      xsel  # for copying
      clipmenu  # for copying

      # packer
      unzip
      unar
      xarchiver
      p7zip

      # file managers
      vifm-full
      # pcmanfm
      ranger

      # IDE
      # spacevim
      # sublime3
      # neovim
      vscode
      arduino
      jetbrains.pycharm-community
      # jetbrains.pycharm-professional
      # thonny
      unityhub

      # LaTeX
      texlive.combined.scheme-full
      # texstudio
      mindforger

      # graphics
      blender
      darktable
      gimp
      krita

      # www
      firefox
      geckodriver
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
      # teams
      # skype

      # cd burner
      brasero

      # snipping tool
      shutter

      # office
      libreoffice

      firmwareLinuxNonfree
      microcodeIntel

      # media
      feh # picture viewer
      mpv # video player
      libdvdcss # plugin to play cd/dvd in mpv
      moc  # music player
      youtube-dl

      psutils
      pciutils
      gputils

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
        bpython
        pylint
        jupyter
      ]))
    ];
  };
}
