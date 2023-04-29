### EXPORT ###
set fish_greeting                                 # Supresses fish's intro message
# set TERM "xterm-256color"                         # Sets the terminal type

### PROMPT
functions -q fish_right_prompt && fish_right_prompt

# theme
set -g theme_color_scheme terminal-dark
set -g fish_prompt_pwd_dir_length 1
set -g theme_display_user yes
set -g theme_hide_hostname no
set -g theme_hostname always

set -gx EDITOR nvim
# set -gx BROWSER firefox
set -gx BROWSER librewolf
set -gx DISPLAY :0

### ALIASES

# X11
alias xx='xinit'

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
alias reboot="doas reboot";
alias poff="doas poweroff";
alias t="btop";
alias ll="exa -l --icons --all";
alias lt="exa --tree --level=2 -a --color auto --icons"

# python
alias py3="python3.9";
alias py="python";

# backup config files to git
alias cong="py /home/lk/configs/scripts/git_conf.py";

# docker
alias dc="docker container";

# programs
alias lgi="lazygit";
alias ldo="lazydocker";

# nvim
alias vi="nvim";
alias lazy="NVIM_APPNAME=lazyvim nvim"
alias nvc="NVIM_APPNAME=nvchad nvim"

# kitty
alias icat="kitty +kitten icat";
alias d="kitty +kitten diff";
alias hg="kitty +kitten hyperlinged_grep";
alias s="kitty +kitten ssh";

### SET MANPAGER
### Uncomment only one of these!

### "bat" as manpager
set -x MANPAGER "sh -c 'col -bx | bat -l man -p'"

### "nvim" as manpager
# set -x MANPAGER "nvim -c 'set ft=man' -"


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

if status is-interactive
    # Commands to run in interactive sessions can go here
  fish_config theme choose Tomorrow\ Night\ Bright
end
