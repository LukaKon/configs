{config, lib, ...}:
{
    environment.shellAliases = {
                                # git
                                gs = "git status";
                                ga = "git add";
                                gc = "git commit";
                                gp = "git push";

                                # term
                                susp = "systemctl suspend";
                                reboot = "doas reboot";

                                # nix
                                upnix = "sudo nix-channel --update && nix-env -u";
                                rebuild = "sudo nixos-rebuild switch";
                                upos = "sudo nixos-rebuild switch --upgrade";


                                # btrfs snapshots
                                sb = "python3 /home/lk/configs/scripts/snapshot_mac.py";

                                # backup config files to git
                                cong = "python3 /home/lk/configs/scripts/git_conf.py";
                                # deploy nix config files in /etc/nixos and rebuild system
                                nixdep = "python3 /home/lk/configs/scripts/nix_deploy_mac.py";
                            };
}
