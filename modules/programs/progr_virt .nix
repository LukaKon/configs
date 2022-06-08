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

        eclipses.eclipse-sdk
        eclipses.eclipse-cpp
        eclipses.eclipse-platform
        eclipses.eclipse-committers

        kdevelop

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
        # darktable
        # gimp
        # krita
        # flameshot

        # www
        firefox
        # brave

        # freetube

        # office
        # libreoffice

        # media
        feh # picture viewer
        moc # music player
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
