{ config, pkgs, ... }:

{
  services.xserver.videoDrivers = [ "nvidia" ];
  # services.xserver.videoDrivers = ["modesetting" "nvidia"];
  environment.systemPackages = with pkgs;
    [
      # nvtop
    ];

  # hardware.opengl.driSupport32Bit = true;
  # virtualisation.docker.enableNvidia = true;
}
