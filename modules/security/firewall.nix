{ config, ... }:

{
  networking.firewall.allowedTCPPorts = [
    3000
    8000
    80
    443
  ];
}
