{config, lib, ...}:
{
  environment.shellAliases = {
                                # git
                                gs = "git status -s";
                                ga = "git add";
                                gc = "git commit";
                                gp = "git push";

                                # term
                                susp = "systemctl suspend";
                                reboot = "doas reboot";

                                # editor
                                vi = "nvim";

                                # nix
                                # upnix = "sudo nix-channel --update && nix-env -u";
                                rebuild = "sudo nixos-rebuild switch";
                                upos = "sudo nixos-rebuild switch --upgrade";

                                # btrfs snapshots
                                # sb = "python ${path_script}snapshot.py";
                                sb = "python3 /home/lk/configs/scripts/snapshot.py";

                                # backup config files to git
                                cong = "python3 /home/lk/configs/scripts/git_conf.py";
                                # deploy nix config files in /etc/nixos and rebuild system
                                nixdep = "python3 /home/lk/configs/scripts/nix_deploy.py";
                                # deploy qtile config files in /home/lk/.config/qtile
                                qdep = "python3 /home/lk/configs/scripts/qtile_deploy.py";

                                # rsync
                                # data
                                #rdata = "cd && rsync -rav --exclude=".snapshots" data/ ssh
                                #lk@192.168.0.2:/volume2/homes/lk/Drive/pliki/";
                              };
                            }
