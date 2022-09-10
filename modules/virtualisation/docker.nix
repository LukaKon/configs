{ config, lib, pkgs, ... }:
{
  virtualisation = {
    docker = {
      enable = true;
    };
  };

  environment.systemPackages = with pkgs; [
    # docker
    docker-compose
    # docker-compose_2
    # arion
    lazydocker
  ];
}
