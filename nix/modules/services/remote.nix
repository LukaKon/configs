{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs;
    [
      # remmina
      # tigervnc
    ];

  services.xrdp.enable = true;
  services.xrdp.defaultWindowManager = "xfce4-session";
  # services.xrdp.defaultWindowManager = "startplasma-x11";


  # nixpkgs.config.permittedInsecurePackages = [
  #   "xrdp-0.9.9"
  # ];

  networking.firewall.allowedTCPPorts = [ 3389 5995 ];
}
