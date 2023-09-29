### EXPORT ###
set fish_greeting # Supresses fish's intro message
# set TERM "xterm-256color"                         # Sets the terminal type

### PROMPT
function starship_transient_prompt_func
  starship module character
end
starship init fish | source
enable_transience

function starship_transient_rprompt_func
  starship module time
end
starship init fish | source
enable_transience

# theme
set -g theme_color_scheme terminal-dark
set -g fish_prompt_pwd_dir_length 1
set -g theme_display_user yes
set -g theme_hide_hostname no
set -g theme_hostname always

set -gx EDITOR hx
set -gx BROWSER firefox
set -gx DISPLAY :0

set FZF_DEFAULT_OPTS "--extended --cycle"

### ALIASES

# X11
alias xx='xinit'

# git
alias gs="git status -s"
alias ga="git add"
alias gc="git commit"
alias gp="git push"
alias gpull="git pull"
alias gb="git branch"
alias gch="git checkout"
alias gm="git merge"
alias gf="git fetch"
alias glog="git log --graph --pretty=oneline --abbrev-commit"

# term
alias reboot="doas reboot"
alias poff="doas poweroff"
alias t="btop"
alias ll="exa -l --icons --all"
alias lt="exa --tree --level=2 -a --color auto --icons"

# python
alias py3="python3.9"
alias py="python"

# backup config files to git
alias cong="py /home/lk/nix_conf/scripts/git_conf.py"

# programs
# linux
alias lgi="lazygit"
alias ldo="lazydocker"
alias dc="docker container"
# freebsd
alias ap="doas appjail"
alias ba="doas bastille"
alias vm="doas vm"

# weather
alias wt="curl wttr.in"
# cheat sheet
alias cs="~/configs/scripts/cht.sh"

# nvim
alias vi="nvim"
alias lazy="NVIM_APPNAME=lazyvim nvim"
alias nvc="NVIM_APPNAME=nvchad nvim"

# ssh
alias lsh="ssh -i ~/.ssh/local"
alias dsh="ssh -i ~/.ssh/lap"

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
