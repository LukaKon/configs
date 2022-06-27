{ config, lib, pkgs, ... }:
{
  virtualisation = {
    docker = {
      enable = true;
    };
  };

  services.kubernetes = {
    roles = [ "master" "node" ];
    masterAddress = "api.kube:6443";

    kubelet.extraOpts = "--fail-swap-on=false";
  };

  environment.systemPackages = with pkgs; [
    # docker
    docker-compose
    # arion
    lazydocker

    # kubernetes
    kompose
    kubectl
    kubernetes

    # helm
    kubernetes-helm-wrapped
  ];
}
