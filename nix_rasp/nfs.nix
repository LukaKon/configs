{config, ...}:

{
    fileSystems."/export/share" = {
        device = "/home/lk/share/";
        options = ["bind" "nfsvers=4.2" "x-systemd.automount" "noauto"];
    };

    services.nfs.server = {
                            enable = true;
                            exports = ''
                                    /export             192.168.1.3(rw,fsid=0,no_subtree_check,async)
                                    /export/share        192.168.1.3(rw,nohide,insecure,no_subtree_check,async)
                            '';

    };

    networking.firewall.allowedTCPPorts = [2049];
}