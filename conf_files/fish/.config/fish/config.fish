### EXPORT ###
set fish_greeting                                 # Supresses fish's intro message
# set TERM "xterm-256color"                         # Sets the terminal type

### ALIASES

# git
   alias gs="git status -s";
   alias ga="git add";
   alias gc="git commit";
   alias gp="git push";
   alias gpull="git pull";
   alias gb="git branch";
   alias gch="git checkout";
   alias gm="git merge";
   alias gf="git fetch";
   alias glog="git log --graph --pretty=oneline --abbrev-commit";

    # term
   alias susp="systemctl suspend";
   alias reboot="doas reboot";
   alias poff="doas poweroff";
   alias top="bpytop";
   alias ll="exa -l --icons --all";
    alias tb="toolbox"

    # python
    alias py="python";

    # backup config files to git
    cong = "py /home/lk/configs/scripts/git_conf.py";

    # docker
    alias dc="docker container";

    # programs
   alias lgi="lazygit";
   alias ldo="lazydocker";
    
    # nvim
    alias vi="nvim";
    
    # kitty
   alias icat="kitty +kitten icat";
   alias d="kitty +kitten diff";
   alias hg="kitty +kitten hyperlinged_grep";
   alias s="kitty +kitten ssh";

### SET MANPAGER
### Uncomment only one of these!

### "bat" as manpager
#set -x MANPAGER "sh -c 'col -bx | bat -l man -p'"

### "nvim" as manpager
# set -x MANPAGER "nvim -c 'set ft=man' -"

alias tb="toolbox"

### SET EITHER DEFAULT EMACS MODE OR VI MODE ###
function fish_user_key_bindings
  # fish_default_key_bindings
  fish_vi_key_bindings
end
### END OF VI MODE ###

### AUTOCOMPLETE AND HIGHLIGHT COLORS ###
set fish_color_normal brcyan
set fish_color_autosuggestion '#7d7d7d'
set fish_color_command brcyan
set fish_color_error '#ff6c6b'
set fish_color_param brcyan

### SETTING THE STARSHIP PROMPT ###
starship init fish | source



# if status is-interactive
    # Commands to run in interactive sessions can go here
# end
