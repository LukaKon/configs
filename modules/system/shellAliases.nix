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
                                vi = "nvim";
                                # vi = "vim";

                                # python
                                py = "python";

                                # backup config files to git
                                cong = "py /home/lk/configs/scripts/git_conf.py";
    
                                # docker
                                dc = "docker container";
                              };
                            }
