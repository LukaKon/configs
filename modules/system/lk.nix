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

        # remote controle
        rustdesk

        # office
        libreoffice

        # graphic
        gimp
        darktable
        blender

        youtube-dl
        freetube

        # packer
        unzip
        unar
        xarchiver
        p7zip

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
        librewolf
        # ungoogled-chromium

        #spacevim
        # vscode
        dbeaver
        vscodium
        arduino
        # jetbrains.pycharm-community
        # jetbrains.pycharm-professional
        # unityhub

        # mindforger

        # comunicator
        slack
        # telegram-cli
        element-desktop

        # video conference
        #zoom-us
        jitsi-meet-electron

        # file managers
        # vifm-full
        # ranger
        fzf
        ripgrep

        # media
        feh # picture viewer
        moc # music player

        # LaTeX
        texlive.combined.scheme-full
        # texstudio

        (python310.withPackages (ps: with ps;
        [
          #   ptpython

          pyls-isort
          rope
          autopep8
          flake8

          #   # colorama
          psutil
          pip
          # pynvim
          yapf
          jedi
          pylint
          #   # jupyter
        ]))
      ];
  };
}
