{ config, pkgs, ... }:

{
  environment = {
    defaultPackages = with pkgs;
      [
        firmwareLinuxNonfree
        microcodeIntel
        
        nodePackages.pyright
        nodePackages.vscode-langservers-extracted
        nodePackages.dockerfile-language-server-nodejs
        # nodePackages.typescript-language-server
        # nodePackages.typescript
        nodePackages.yaml-language-server

        texlab
        taplo-lsp

        rnix-lsp
        nixfmt
        nixpkgs-fmt

        hadolint # docker linter

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
