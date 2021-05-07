{config, pkgs, ... }:

{
    services.xserver.videoDrivers = ["modesetting" "nvidia"];
    environment.systemPackages = with pkgs;
            [
                cudaPackages.cudatoolkit_11
            ];
}