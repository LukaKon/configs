{ config, lib, pkgs, ... }:
{
  virtualisation = {
    docker = {
      enable = true;
    };
  };

  environment.systemPackages = with pkgs; [
    docker-compose
    # arion
    lazydocker
    kubernetes-helm-wrapped
  ];
}
