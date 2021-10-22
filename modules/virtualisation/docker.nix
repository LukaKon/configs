{config, lib, pkgs, ...}:
{
  virtualisation = {
    docker = {
    enable = true;
    # enableNvidia= true;
  };
  # podman = {
  #   enable = true;
  #   dockerSocket.enable = true;
  #   defaultNetwork.dnsname.enable = true;
  # };
  };


  environment.systemPackages = with pkgs; [
    docker-compose
    # arion
    lazydocker
    ];
}
