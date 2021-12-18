{ config, pkgs, ... }:

{
  environment = {
    systemPackages = with pkgs;
    [
      # nix

      doas
      tree
      pstree  # process tree
      wget
      curl
      git
      rsync
      bat # cat
      fd  # find
      fzf

      nodejs

      # monitoring
      # bmon
      # htop
      # iotop
      glances
      lm_sensors
      # ncdu # disk analisys

      light # control display brightness

      # terminal
      alacritty
      # xterm
      # wezterm
      # kitty
      # wayst

      # text editor
      # neovim
      # ranger
      # ueberzug
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

      # IDE
      # vscode
      vscodium
      # arduino
      # jetbrains.pycharm-community
      # thonny
      # dbeaver

      # LaTeX
      texlive.combined.scheme-full
      # texstudio
      # mindforger

      # graphics
      # blender
      # darktable
      # gimp
      # krita

      # www
      firefox
      geckodriver
      qutebrowser
      brave
      # tor-browser-bundle-bin

      # comunicator
      # signal-desktop
      slack

      # video conference
      zoom-us
      # teams
      # skype

      # cd burner
      brasero
      # etcher
      # gparted

      # snipping tool
      # shutter

      # office
      libreoffice

      # games
      # openarena

      firmwareLinuxNonfree
      microcodeIntel

      # media
      feh # picture viewer
      # mpv # video player
      # libdvdcss # plugin to play cd/dvd in mpv
      moc  # music player

      psutils
      pciutils

      (python39.withPackages(ps: with ps;
      [
        autopep8
        black
        # flake8
        colorama
        psutil
        pip
        pynvim
        yapf
        jedi
        termcolor
        # ipython
        # bpython
        # ptpython
        pylint
        # jupyter
      ]))
    ];
  };
}
