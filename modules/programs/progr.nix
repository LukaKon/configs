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
        x11_ssh_askpass
        #git-crypt
        #gnupg # gpg
        # pinentry-gnome

        # terminal
        alacritty
        # foot

        flameshot

        # www
        firefox
        # brave

        freetube

        # office
        libreoffice

        youtube-dl

        # packer
        unzip
        unar
        xarchiver
        p7zip

        nix-prefetch-git

        tree
        pstree # process tree
        wget
        curl
        rsync
        bat # cat
        fd # find

        glances
        lm_sensors
        # ncdu # disk analisys
        sysstat

        xsel # for copying
        clipmenu # for copying
      ];
  };
}
