{ config, pkgs, ... }:

{
  users.users.lk = {
    isNormalUser = true;
    home = "/home/lk";
    description = "lko";
    extraGroups = [ "wheel" "networkmanager" "dialout" "libvirtd" "docker"];
    shell = pkgs.zsh;
    packages = with pkgs;
    [
      wezterm
      #kitty

      # www
      qutebrowser

      # IDE
      # neovim
      # spacevim
      # neovide
      # uivonim
      # vscode
      vscodium
      arduino
      jetbrains.webstorm
      # jetbrains.pycharm-community
      jetbrains.pycharm-professional
      # thonny
      # unityhub
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
