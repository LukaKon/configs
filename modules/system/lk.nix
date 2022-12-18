{ config, pkgs, ... }:

{
  users.users.lk = {
    isNormalUser = true;
    home = "/home/lk";
    description = "lko";
    extraGroups = [
      "wheel"
      "networkmanager"
      "dialout"
      "libvirtd"
      "docker"
      "video"
      "vboxuser"
    ];
    shell = pkgs.zsh;
    packages = with pkgs;
      [
        # www
        firefox
        # brave
        qutebrowser
        librewolf

        # appimage-run

        # dev
        neovim
        helix
        vscodium
        dbeaver
        arduino
        unityhub
        # meld
        postman

        # remote controle
        # rustdesk

        # office
        libreoffice
        flameshot
        # czkawka

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

        # mouse
        solaar

        ## keyboard
        # qmk
        qmk
        qmk-udev-rules
        # via
        via
        vial
        ## keyboard

        # comunication
        slack
        # element-desktop
        #zoom-us
        jitsi-meet-electron
        discord

        # file managers
        fzf
        ripgrep
        fd # find

        # media
        feh # picture viewer
        moc # music player

        # LaTeX
        texlive.combined.scheme-full
      ];
  };
}
