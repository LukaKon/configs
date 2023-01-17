{ config, pkgs, ... }:

{
  users = {
    groups.lk.gid = 1002;
    users.lk = {
      isNormalUser = true;
      home = "/home/lk";
      description = "virtual user";
      uid = 1002;
      extraGroups = [
        "wheel"
        "networkmanager"
        "docker"
        "video"
        "lk"
      ];

      shell = pkgs.fish;
      packages = with pkgs;
        [
          # www
          firefox
          # brave
          qutebrowser
          librewolf

          # dev
          neovim
          #helix
          #vscodium
          # dbeaver
          #arduino
          #unityhub
          # meld
          # postman

          # LaTeX
          texlive.combined.scheme-full
        ];
    };
  };
}
