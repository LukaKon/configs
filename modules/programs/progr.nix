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

      # graphics
      # blender
      darktable
      gimp
      krita

      # www
      firefox
      brave

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
    ];
  };
}