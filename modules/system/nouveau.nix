{config, pkgs, ... }:

{
  services.xserver.videoDrivers = ["nouveau"];
  # services.xserver.videoDrivers = ["modesetting" "nvidia"];
  environment.systemPackages = with pkgs;
  [
    # nvtop
    # cudaPackages.cudatoolkit_11
  ];
}
