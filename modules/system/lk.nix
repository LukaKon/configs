{ config, pkgs, ... }:

{
  users.users.lk = {
    isNormalUser = true;
    home = "/home/lk";
    description = "lko";
    extraGroups = [ "wheel" "networkmanager" "dialout" "libvirtd" "docker" "video" "vboxuser" ];
    shell = pkgs.zsh;
    packages = with pkgs;
      [
        # www
        firefox
        # brave
        qutebrowser
        librewolf

        # dev
        vscodium
        dbeaver
        arduino
        # unityhub
        meld
        postman

        # remote controle
        rustdesk

        # office
        libreoffice
        flameshot
        czkawka

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


        # qmk
        qmk
        qmk-udev-rules

        # via
        via
        vial

        # mindforger

        # comunication
        slack
        element-desktop
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
          pygments

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
