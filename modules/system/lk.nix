{ config, pkgs, ... }: # neovim-flake, ... }:

{
  users.users.lk = {
    isNormalUser = true;
    home = "/home/lk";
    description = "lko";
    extraGroups = [ "wheel" "networkmanager" "dialout" "libvirtd" "docker" "video" ];
    shell = pkgs.zsh;
    packages = with pkgs;
      [
        dotnet-sdk
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

        # IDE
        # neovim

        # neovim-flake.defaultPackage.x86_64-linux

        helix
        nodePackages.vscode-langservers-extracted
        nodePackages.dockerfile-language-server-nodejs
        nodePackages.typescript-language-server

        rnix-lsp

        # spacevim
        # neovide
        # uivonim
        # vscode
        vscodium
        # eclipses.eclipse-jee
        arduino
        # jetbrains.webstorm
        # jetbrains.pycharm-community
        jetbrains.pycharm-professional
        # thonny
        # unityhub
        dbeaver
        # postman

        # comunicator
        # signal-desktop
        slack
        discord
	#whatsapp-for-linux

        # video conference
        zoom-us

        # LaTeX
        texlive.combined.scheme-full
        # texstudio
        # mindforger

        (python310.withPackages (ps: with ps;
        [
          python-lsp-server
          # autopep8
          # flake8
          # colorama
          psutil
          pip
          pynvim
          yapf
          jedi
          # pylint
          # jupyter
        ]))
      ];
  };
}
