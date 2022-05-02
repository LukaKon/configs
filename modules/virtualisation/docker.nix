{ config, lib, pkgs, ... }:
{
  virtualisation = {
    docker = {
      enable = true;
      #enableNvidia= true;
    };
  };

  environment.systemPackages = with pkgs; [
    docker-compose_2
    # arion
    lazydocker
  ];

  # users.users.<myuser>.extraGroups = [ "docker" ];
}
