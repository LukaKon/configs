{config, ...}:

{
    fileSystems."/export/data" = {
        device = "/home/lk/data/programing";
        options = ["bind" "nfsvers=4.2" "x-systemd.automount" "noauto"];
    };

    services.nfs.server = {
                            enable = true;
                            exports = ''
                                    /export             192.168.1.10(rw,fsid=0,no_subtree_check,async)
                                    /export/data        192.168.1.10(rw,nohide,insecure,no_subtree_check,async)
                            '';

    };

    networking.firewall.allowedTCPPorts = [2049];
}