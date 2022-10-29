{ config, pkgs, ... }:

{
  environment = {
    defaultPackages = with pkgs;
      [
        firmwareLinuxNonfree
        microcodeIntel

        glances

        solaar

        # to link config files to .config
        stow

        psutils
        pciutils
        gputils

        git
        lazygit

        # terminal
        alacritty
        kitty

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
