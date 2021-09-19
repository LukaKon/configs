{ config, ... }:

{
  fileSystems."/home/lk/data" = {
                      device = "/dev/disk/by-uuid/71bff5ad-3209-4d8f-8ead-65733cfb4b88";
                      fsType = "btrfs";
                      options = ["subvol=@data"];
                  };

  fileSystems."/home/lk/vm" = {
                      device = "/dev/disk/by-uuid/ef94fe71-c21b-4da8-aabb-e80588efc941";
                      fsType = "btrfs";
                      options = ["subvol=@vm"];
                  };
}
