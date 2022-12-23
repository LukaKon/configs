{ config, pkgs, ... }:

{
  console = {
    font = "firacode-14"; #"Lat2-Terminus16";
    keyMap = "pl";
  };

  environment.systemPackages = with pkgs; [
    any-nix-shell
    starship
  ];

  programs = {
    fish = {
      enable = true;
      promptInit = ''
        any-nix-shell fish --info-right | source
      '';
    };
  };
}
