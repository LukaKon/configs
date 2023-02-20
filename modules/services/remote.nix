{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs;
    [
      # remmina
    ];

  services.xrdp.enable = true;
  services.xrdp.defaultWindowManager = "openbox";
  # services.xrdp.defaultWindowManager = "startplasma-x11";


  # nixpkgs.config.permittedInsecurePackages = [
  #   "xrdp-0.9.9"
  # ];

  networking.firewall.allowedTCPPorts = [ 3389 ];
}
