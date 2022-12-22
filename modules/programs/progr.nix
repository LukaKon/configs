{ config, pkgs, ... }:

{
  environment = {
    defaultPackages = with pkgs;
      [
        firmwareLinuxNonfree
        microcodeIntel

        # glances
        bpytop

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
        # foot

        nix-prefetch-git

        # firmware service
        fwupd-efi

        tree
        pstree # process tree
        wget
        curl
        rsync
        bat # cat

        lm_sensors
        # ncdu # disk analisys
        sysstat

        xsel # for copying
        clipmenu # for copying
      ];
  };
}
