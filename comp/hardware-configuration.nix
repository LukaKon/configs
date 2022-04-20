# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot.initrd.availableKernelModules = [ "xhci_pci" "ahci" "nvme" "usbhid" "uas" "sd_mod" "sr_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/847962e7-9cac-4734-97e2-0e1f7e425ad0";
      fsType = "btrfs";
      options = [ "subvol=nixos" ];
    };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/CE70-80B2";
      fsType = "vfat";
    };

  fileSystems."/home/lk/data" =
    { device = "/dev/disk/by-uuid/71bff5ad-3209-4d8f-8ead-65733cfb4b88";
      fsType = "btrfs";
      options = [ "subvol=@data" ];
    };

  fileSystems."/home/lk/dev" =
    { device = "/dev/disk/by-uuid/a3bed21d-488f-4233-b00b-98a378791ff6";
      fsType = "btrfs";
      options = [ "subvol=@dev" ];
    };

  swapDevices =
    [ { device = "/dev/disk/by-uuid/f3e17313-09db-4d1a-9238-ea58a296dd2f"; }
    ];

  powerManagement.cpuFreqGovernor = lib.mkDefault "powersave";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
