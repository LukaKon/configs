# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot.initrd.availableKernelModules = [ "ohci_pci" "ehci_pci" "ahci" "usbhid" "sd_mod" "sr_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-intel" "wl" ];
  boot.extraModulePackages = [ config.boot.kernelPackages.broadcom_sta ];

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/0fad7f12-efe4-4c74-9992-65e6e2ad0678";
      fsType = "btrfs";
      options = [ "subvol=@root" ];
    };

  fileSystems."/nix" =
    { device = "/dev/disk/by-uuid/0fad7f12-efe4-4c74-9992-65e6e2ad0678";
      fsType = "btrfs";
      options = [ "subvol=@nix" ];
    };

  fileSystems."/var" =
    { device = "/dev/disk/by-uuid/0fad7f12-efe4-4c74-9992-65e6e2ad0678";
      fsType = "btrfs";
      options = [ "subvol=@var" ];
    };

  fileSystems."/srv" =
    { device = "/dev/disk/by-uuid/0fad7f12-efe4-4c74-9992-65e6e2ad0678";
      fsType = "btrfs";
      options = [ "subvol=@srv" ];
    };

  fileSystems."/opt" =
    { device = "/dev/disk/by-uuid/0fad7f12-efe4-4c74-9992-65e6e2ad0678";
      fsType = "btrfs";
      options = [ "subvol=@opt" ];
    };

  fileSystems."/home" =
    { device = "/dev/disk/by-uuid/0fad7f12-efe4-4c74-9992-65e6e2ad0678";
      fsType = "btrfs";
      options = [ "subvol=@home" ];
    };

  fileSystems."/tmp" =
    { device = "/dev/disk/by-uuid/0fad7f12-efe4-4c74-9992-65e6e2ad0678";
      fsType = "btrfs";
      options = [ "subvol=@tmp" ];
    };

  fileSystems."/var/lib/docker/btrfs" =
    { device = "/tmp/@tmp/@home/@var/lib/docker/btrfs//deleted";
      fsType = "none";
      options = [ "bind" ];
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/149A-9E90";
      fsType = "vfat";
    };

  swapDevices =
    [ { device = "/dev/disk/by-uuid/360df655-6964-4ae8-a93e-bf1803517dd2"; }
    ];

}
