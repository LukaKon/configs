{ config, pkgs, ... }:

{
  users.users.lk = {
    isNormalUser = true;
    home = "/home/lk";
    description = "lko";
    extraGroups = [ "wheel" "networkmanager" "dialout" "libvirtd" "docker" "video" ];
    shell = pkgs.zsh;
    packages = with pkgs;
      [
        flameshot

        # office
        libreoffice

        # graphic
        gimp
        darktable

        youtube-dl
        freetube

        # packer
        unzip
        unar
        xarchiver
        p7zip

        # rustup

        # dotnet-sdk
        clang
        clang-tools
        lldb
        #gcc
        cmake
        #bmake
        # luajit
        nodejs-18_x
        #deno

        #firejail

        # qmk
        qmk
        qmk-udev-rules

        # via
        via
        vial

        # www
        firefox
        # brave
        qutebrowser
        # ungoogled-chromium

        #lapce

        helix

        # nodePackages.pyright
        # nodePackages.vscode-langservers-extracted
        # nodePackages.dockerfile-language-server-nodejs
        # # nodePackages.typescript-language-server
        # # nodePackages.typescript
        # nodePackages.yaml-language-server

        # texlab
        # taplo-lsp

        # rnix-lsp
        # nixfmt
        # nixpkgs-fmt

        # hadolint # docker linter

        #spacevim
        # vscode
        dbeaver
        vscodium
        arduino
        # jetbrains.pycharm-community
        #jetbrains.pycharm-professional
        # unityhub

        mindforger

        # comunicator
        slack
        # telegram-cli

        # video conference
        #zoom-us
        #jitsi-meet
        jitsi-meet-electron

        # file managers
        vifm-full
        # ranger
        fzf
        ripgrep

        # media
        feh # picture viewer
        moc # music player

        # LaTeX
        texlive.combined.scheme-full
        # texstudio

        glances

        (python310.withPackages (ps: with ps;
        [
          ptpython

          python-lsp-server
          pylsp-mypy
          pyls-isort
          rope
          autopep8
          flake8

          # colorama
          psutil
          pip
          pynvim
          yapf
          jedi
          pylint
          # jupyter
        ]))
      ];
  };
}
