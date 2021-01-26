{ config, ... }:

{
  fileSystems."/home/lk/data" = {
                      device = "/dev/disk/by-uuid/71bff5ad-3209-4d8f-8ead-65733cfb4b88";
                      fsType = "btrfs";
                      options = ["subvol=@data"];
                  };
  fileSystems."/home/lk/vm" = {
                      device = "/dev/disk/by-uuid/2f8299dd-bba5-4256-81cf-516828cc910b";
                      fsType = "btrfs";
                      options = ["subvol=@vm"];
                  };
}
