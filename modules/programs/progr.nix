{ config, pkgs, ... }:

{
  environment = {
    defaultPackages = with pkgs;
      [
        firmwareLinuxNonfree
        microcodeIntel

        glances

        # to link config files to .config
        stow

        psutils
        pciutils
        gputils

        git
        # x11_ssh_askpass
        lazygit
        #git-crypt
        #gnupg # gpg
        # pinentry-gnome

        # terminal
        alacritty

        nix-prefetch-git

        tree
        pstree # process tree
        wget
        curl
        rsync
        bat # cat
        fd # find

        lm_sensors
        # ncdu # disk analisys
        sysstat

        xsel # for copying
        clipmenu # for copying
      ];
  };
}
