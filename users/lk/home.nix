{ config, pkgs, ... }:

let
  # customNeovim = import ./config/nvim/nvim.nix;
  # customNeovim = import ../../programs/nvim/nvim.nix;

in
{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  # programs.neovim = customNeovim pkgs;


  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "lk";
  home.homeDirectory = "/home/lk";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "21.05";

  programs.git = {
      enable = true;
      userName = "lukakon";
      userEmail = "lukasz.konieczny.lk@protonmail.com";
      extraConfig = {
        init = { defaultBranch = "main"; };
      };
    };

  programs.gpg = {
    enable = true;
  };

  services.gpg-agent = {
    enable = true;
    pinentryFlavor = "gnome3";#"qt";
  };

  home.packages = with pkgs; [
    git
    git-crypt
    gnupg # gpg
    pinentry-gnome

    # terminal
    alacritty
    # foot

    # file managers
    vifm-full
    ranger

    # IDE
    # neovim-nightly
    neovim
    # spacevim
    # neovide
    uivonim
    # sublime3
    vscode
    arduino
    # jetbrains.pycharm-community
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
      etcher
      # gparted

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
}
