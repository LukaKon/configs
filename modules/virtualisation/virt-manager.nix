{pkgs, ... }:

{
    boot.kernelModules = [ "kvm-intel" ];
    virtualisation = {
        libvirtd = {
        enable = true;
        qemu.ovmf.enable = true;
        };
    };
    programs.dconf.enable = true;
    environment.systemPackages = with pkgs; [
      virt-manager
      virt-viewer
      kvm
      qemu
       ];

    # networking.defaultGateway = "192.168.1.1";

    # networking.bridges.br0.interfaces = ["enp0s31f6"];
    # networking.interfaces.br0 = {
    #   useDHCP = false;
    #   ipv4.addresses = [{
    #     "address" = "192.168.1.3";
    #     "prefixLength" = 24;
    #   }];
    # };

    networking.firewall.allowedTCPPorts = [5900];
}
