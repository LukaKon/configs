{pkgs, ... }:

{
    boot.kernelModules = [ "kvm-intel" ];
    virtualisation.libvirtd.enable = true;
    programs.dconf.enable = true;
    environment.systemPackages = with pkgs; [ virt-manager ];
}