{ config, pkgs, ... }:

{
  console = {
    font = "firacode-14"; #"Lat2-Terminus16";
    keyMap = "pl";
  };

  environment.systemPackages = with pkgs; [
    any-nix-shell
    python310Packages.pygments
  ];

  programs = {
    fish = {
      enable = true;
      promptInit = ''
        any-nix-shell zsh --info-right | source /dev/stdin
      '';
    };
  };
}
