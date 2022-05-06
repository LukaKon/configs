# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [
      (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot.initrd.availableKernelModules = [ "xhci_pci" "ahci" "nvme" "usbhid" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" =
    {
      device = "/dev/disk/by-uuid/847962e7-9cac-4734-97e2-0e1f7e425ad0";
      fsType = "btrfs";
      options = [ "subvol=nixos" ];
    };

  fileSystems."/home/lk/dev" =
    {
      device = "/dev/disk/by-uuid/a3bed21d-488f-4233-b00b-98a378791ff6";
      fsType = "btrfs";
      options = [ "subvol=@dev" ];
    };

  fileSystems."/boot" =
    {
      device = "/dev/disk/by-uuid/CE70-80B2";
      fsType = "vfat";
    };

  fileSystems."/home/lk/data" =
    {
      device = "/dev/disk/by-uuid/71bff5ad-3209-4d8f-8ead-65733cfb4b88";
      fsType = "btrfs";
      options = [ "subvol=@data" ];
    };

  fileSystems."/home/lk/vm" =
    {
      device = "/dev/disk/by-uuid/63742996-98f1-4404-b850-b61be86ea7cd";
      fsType = "btrfs";
      options = [ "subvol=@vm" ];
    };

  swapDevices =
    [{ device = "/dev/disk/by-uuid/f3e17313-09db-4d1a-9238-ea58a296dd2f"; }];

  # The global useDHCP flag is deprecated, therefore explicitly set to false here.
  # Per-interface useDHCP will be mandatory in the future, so this generated config
  # replicates the default behaviour.
  networking.useDHCP = lib.mkDefault false;
  networking.interfaces.br-247417ff9737.useDHCP = lib.mkDefault true;
  networking.interfaces.br-738b973061c6.useDHCP = lib.mkDefault true;
  networking.interfaces.docker0.useDHCP = lib.mkDefault true;
  networking.interfaces.enp0s31f6.useDHCP = lib.mkDefault true;
  networking.interfaces.veth0a67ca8.useDHCP = lib.mkDefault true;
  networking.interfaces.veth329e418.useDHCP = lib.mkDefault true;
  networking.interfaces.vethfb219a0.useDHCP = lib.mkDefault true;
  networking.interfaces.wlp1s0.useDHCP = lib.mkDefault true;

  powerManagement.cpuFreqGovernor = lib.mkDefault "powersave";
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
