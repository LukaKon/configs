{config, pkgs, ... }:

{
  services.xserver.videoDrivers = ["nvidia"];
  # services.xserver.videoDrivers = ["modesetting" "nvidia"];
  environment.systemPackages = with pkgs;
  [
    # nvtop
    # cudaPackages.cudatoolkit_11
  ];
}
