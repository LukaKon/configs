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
      dotnet-sdk
      clang
      clang-tools
      #gcc
      cmake
      #bmake
      luajit

      # wezterm
      #kitty

      #firejail

      # qmk
      qmk
      qmk-udev-rules

      # www
      # qutebrowser
      brave

      # IDE
      # neovim
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
      unityhub
      dbeaver
      postman

      # comunicator
      # signal-desktop
      slack

      # video conference
      zoom-us

      # LaTeX
      texlive.combined.scheme-full
      # texstudio
      # mindforger

      (python39.withPackages(ps: with ps;
      [
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
