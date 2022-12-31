{ config, ... }:

{
  networking.firewall.allowedTCPPorts = [
    3000
    8000
    5432
    6379
    80
    443
  ];
}
