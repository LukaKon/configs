{ config, ... }:

{
  fileSystems."/home/lk/data" = {
                      device = "/dev/disk/by-uuid/71bff5ad-3209-4d8f-8ead-65733cfb4b88";
                      fsType = "btrfs";
                      options = ["subvol=@data"]; 
                  };
  fileSystems."/home/lk/vm" = {
                      device = "/dev/disk/by-uuid/9f74f59d-add9-42b6-926d-a959fbcfd97f";
                      fsType = "btrfs";
                      options = ["subvol=@vm"]; 
                  };
}
