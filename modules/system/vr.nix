{ config, pkgs, ... }:

{
  users = {
    groups.vr.gid = 1002;
    users.vr = {
      isNormalUser = true;
      home = "/home/vr";
      description = "virtual user";
      uid = 1002;
      extraGroups = [
        "wheel"
        "networkmanager"
        "dialout"
        "libvirtd"
        "docker"
        "video"
        "lk"
      ];

      shell = pkgs.fish;
      packages = with pkgs;
        [
          # www
          # firefox
          # brave
          # qutebrowser
          # librewolf

          # dev
          neovim
          #helix
          #vscodium
          dbeaver
          #arduino
          #unityhub
          # meld
          postman

          # LaTeX
          texlive.combined.scheme-full
        ];
    };
  };
}
