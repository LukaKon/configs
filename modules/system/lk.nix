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
        # dotnet-sdk
        clang
        clang-tools
        #gcc
        cmake
        #bmake
        # luajit
        nodejs
        # deno

        # wezterm
        #kitty

        #firejail

        # qmk
        qmk
        qmk-udev-rules

        # www
        # qutebrowser
        ungoogled-chromium

        # IDE/editors
        # lapce

        #jre8
        helix

        nodePackages.vscode-langservers-extracted
        nodePackages.dockerfile-language-server-nodejs
        nodePackages.typescript-language-server

        rnix-lsp
        nixfmt
        nixpkgs-fmt

        # spacevim
        # vscode
        vscodium
        arduino
        # jetbrains.pycharm-community
        jetbrains.pycharm-professional
        # unityhub
        dbeaver

        # comunicator
        # signal-desktop
        slack
        discord
        #whatsapp-for-linux

        # video conference
        #zoom-us
        #jitsi-meet
        #jitsi-meet-electron

        # file managers
        vifm-full
        # ranger
        fzf
        ripgrep

        # graphics
        # blender
        darktable

        # media
        feh # picture viewer
        moc # music player

        # LaTeX
        texlive.combined.scheme-full
        # texstudio
        # mindforger

        nodePackages.pyright

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
