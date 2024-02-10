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
# set -gx QT_QPA_PLATFORMTHEME qt5ct
# set SSH_AUTH_SOCK /tmp/ssh-Zek7BjyxuEDg/agent.79284

# fzf
set -gx FZF_DEFAULT_OPTS "--layout reverse --height=50% --extended --multi --cycle --border rounded --prompt='▶' --pointer='' --marker='' --color fg:#ebdbb2,bg:#282828,hl:#fabd2f,fg+:#ebdbb2,bg+:#3c3836,hl+:#fabd2f --color info:#83a598,prompt:#bdae93,spinner:#fabd2f,pointer:#83a598,marker:#fe8019,header:#665c54"

set -gx FZF_DEFAULT_COMMAND 'fd . --exclude .git --exclude node_modules --exclude target --hidden'

alias ff="fzf --multi --layout reverse --border rounded --border-label '| Find and edit file |' --border-label-pos 5 --preview-window right --preview 'bat -n --color=always {}' --bind 'enter:execute($EDITOR {})'"

alias fcd="cd (fd . --type directory --hidden --exclude .cache --exclude .git --exclude node_modules | fzf --height=70% --border-label '| Find Directory |' --preview='eza --tree --level=1 -a --color auto --icons {}')"

alias h="history | fzf --no-multi --bind 'enter:become($SHELL -c {})'"

### ALIASES

# X11
alias xx='xinit'

# internal screen on/off
alias soff="xrandr --output eDP-1 --off"
alias son="xrandr --output eDP-1 --auto"

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
# alias reboot="doas reboot"
alias reboot="doas init 6"
alias poff="doas poweroff"
alias t="glances"
# alias ll="eza --long --header --changed --total-size --git --icons=auto --color=auto --all"
alias ll="eza --long --header --changed --git --icons=auto --color=auto --all"
alias lt="eza --tree --level=3 -a --color=auto --icons=auto"

# python
alias py3="python3.9"
alias py="python"

# backup config files to git
alias cong="py /home/lk/nix_conf/scripts/git_conf.py"

# programs
alias lgi="lazygit"
# linux
alias ldo="lazydocker"
alias dc="docker container"
# freebsd
alias ap="doas appjail"
alias ba="doas bastille"
alias pot="doas pot"
alias vm="doas vm"
# toolbox
alias tb="toolbox"
alias te="toolbox enter"
alias tc="toolbox create"

# bat
alias bat="bat -p --color always --theme gruvbox-dark"

# weather
alias wt="curl wttr.in"
# cheat sheet
alias cs="~/configs/scripts/cht.sh"

# nvim
# alias vi="nvim"
# alias lazy="NVIM_APPNAME=lazyvim nvim"
# alias nvc="NVIM_APPNAME=nvchad nvim"

# ssh
alias lsh="ssh -i ~/.ssh/local"
alias dsh="ssh -i ~/.ssh/lap"
alias ra="dsh lk@192.168.1.102"
alias fu="dsh lk@192.168.1.103"
alias na="dsh lk@192.168.1.112"

# NFS
alias media="doas mount -t nfs 192.168.1.103:/tera/data/photos /mnt/photos ;
doas mount -t nfs 192.168.1.103:/tera/data/audio/ /mnt/music ;
doas mount -t nfs 192.168.1.103:/tera/data/dev /mnt/dev ;
doas mount -t nfs 192.168.1.103:/tera/exports /mnt/exports"
alias nas="doas mount -t nfs 192.168.1.112:/volume2/export /mnt/nas"
alias um="doas umount /mnt/nas /mnt/photos /mnt/music /mnt/dev /mnt/exports"

### SET MANPAGER
### Uncomment only one of these!

### "bat" as manpager
set -x MANPAGER "sh -c 'col -bx | bat -l man -p'"

### "nvim" as manpager
# set -x MANPAGER "hx -c 'set ft=man' -"

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
