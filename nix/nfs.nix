{config, ...}:

{
    # fileSystems."/export/data" = {
    #     device = "/home/lk/data/programing";
    #     options = ["bind" "nfsvers=4.2" "x-systemd.automount" "noauto"];
    # };

    # services.nfs.server = {
    #                         enable = true;
    #                         exports = ''
    #                                 /export             192.168.1.10(rw,fsid=0,no_subtree_check,async)
    #                                 /export/data        192.168.1.10(rw,nohide,insecure,no_subtree_check,async)
    #                         '';

    # };
    fileSystems."/mnt/rasp" = {
        device = "192.168.1.9:/share";
        fsType = "nfs";
        # options = ["x-systemd.idle-timeout=600"];
        options = ["nfsvers=4.2" "x-systemd.automount" "noauto" ];
    };

    networking.firewall.allowedTCPPorts = [2049];
}