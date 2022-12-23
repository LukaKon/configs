{ config, lib, ... }:
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
    glog = "git log --graph --pretty=oneline --abbrev-commit";

    # term
    susp = "systemctl suspend";
    reboot = "doas reboot";
    poff = "doas poweroff";
    top = "bpytop";
    ll = "exa -l --icons";

    # python
    py = "python";

    # backup config files to git
    cong = "py /home/lk/configs/scripts/git_conf.py";

    # docker
    dc = "docker container";

    # programs
    lgi = "lazygit";
    ldo = "lazydocker";
    
    # nvim
    vi = "nvim";
    
    # kitty
    icat = "kitty +kitten icat";
    d = "kitty +kitten diff";
    hg = "kitty +kitten hyperlinged_grep";
    s = "kitty +kitten ssh";
  };
}
