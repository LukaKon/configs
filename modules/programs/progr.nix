{ config, pkgs, ... }:

{
  environment = {
    defaultPackages = with pkgs;
      [
        # Logitech mause
        # piper
        # libratbag
        # solaar
        # logiops

        firmwareLinuxNonfree
        microcodeIntel

        glances

        # to link config files to .config
        stow

        psutils
        pciutils
        gputils

        git
        lazygit

        # terminal
        # alacritty
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
