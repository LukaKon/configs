{ config, ... }:

{
  services.btrfs.autoScrub = {
    enable = true;
    interval = "monthly";
    # fileSystems = [
    #   "/"
    #   "/home/$USER"
    #   "/home/$USER/data"
    #   "/home/$USER/vm"
    # ]
  };
}
