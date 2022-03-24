{config, lib, ...}:
{
  environment.shellAliases = {
                                # git
                                gs = "git status -s";
                                ga = "git add";
                                gc = "git commit";
                                gp = "git push";
                                gpull = "git pull";
                                gb = "git branch";
                                gch = "git checkout";
                                gm = "git merge";
                                gf = "git fetch";

                                # term
                                susp = "systemctl suspend";
                                reboot = "doas reboot";

                                # editor
                                # vi = "nvim";
                                vi = "vim";

                                # python
                                py = "python";

                                # btrfs snapshots
                                sb = "py /home/lk/configs/scripts/snapshot.py";
                                sbl = "py /home/lk/configs/scripts/snapshot_lap.py";
                                # backup config files to git
                                cong = "python3 /home/lk/configs/scripts/git_conf.py";
                              };
                            }
