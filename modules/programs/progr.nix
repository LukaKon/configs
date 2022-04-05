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
      # ranger
      fzf
      ripgrep

      # graphics
      # blender
      darktable
      gimp
      krita
      flameshot

      # www
      firefox
      # brave

      freetube

      # cd burner
      #brasero

      # office
      libreoffice

      # media
      feh # picture viewer
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
