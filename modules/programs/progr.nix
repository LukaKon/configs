{ config, pkgs, ... }:

{
  environment = {
    defaultPackages = with pkgs;
      [
        firmwareLinuxNonfree
        microcodeIntel

        # glances
        btop

        # to link config files to .config
        stow

        psutils
        pciutils
        gputils

        git
        lazygit

        # terminal
        # alacritty
        # kitty
        # foot

        nix-prefetch-git

        # firmware service
        # fwupd-efi
        # fwupd

        # packer
        unzip
        unar
        xarchiver
        p7zip

        tree
        pstree # process tree
        wget
        curl
        rsync
        bat # cat

        # file managers
        fzf
        ripgrep
        fd # find
        exa

        # lm_sensors
        # ncdu # disk analisys
        sysstat

        xsel # for copying
        clipmenu # for copying
        xclip
      ];
  };
}
