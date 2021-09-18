{ config, pkgs, ... }:

{
  environment = {
    systemPackages = with pkgs;
    [
      firmwareLinuxNonfree
      microcodeIntel

      psutils
      pciutils
      gputils
    ];
  };
}
