{ config, ... }:

{
  networking.firewall = {
  enable = true;
  allowedTCPPorts = [
    3000
    8000
    8080
    5432
    6379
    80
    443
  ];
  };
}
