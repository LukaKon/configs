set -o vi

eval "$(starship init bash)"
eval "$(fzf --bash)"

[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && \
    . /usr/share/bash-completion/bash_completion
                            
export FZF_DEFAULT_OPTS="--layout reverse --height=50% --extended --multi --cycle --border rounded --prompt='▶' --pointer='' --marker='' --color fg:#ebdbb2,bg:#282828,hl:#fabd2f,fg+:#ebdbb2,bg+:#3c3836,hl+:#fabd2f --color info:#83a598,prompt:#bdae93,spinner:#fabd2f,pointer:#83a598,marker:#fe8019,header:#665c54"

export FZF_DEFAULT_COMMAND='fd . --exclude .git --exclude node_modules --exclude target --hidden'

# Preview file content using bat
export FZF_CTRL_T_OPTS="
  --walker-skip .git,node_modules,target
  --preview 'bat -n --color=always {}'
  --bind 'ctrl-/:change-preview-window(down|hidden|)'"

# CTRL-/ to toggle small preview window to see the full command
# CTRL-Y to copy the command into clipboard using pbcopy
export FZF_CTRL_R_OPTS="
  --preview 'echo {}' --preview-window up:3:hidden:wrap
  --bind 'ctrl-/:toggle-preview'
  --bind 'ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort'
  --color header:italic
  --header 'Press CTRL-Y to copy command into clipboard'"

  # Print tree structure in the preview window
export FZF_ALT_C_OPTS="
  --walker-skip .git,node_modules,target
  --preview 'tree -C {}'"

alias ff="fzf --multi --layout reverse --border rounded --border-label '| Find and edit file |' --border-label-pos 5 --preview-window right --preview 'bat -n --color=always {}' --bind 'enter:execute($EDITOR {})'"

alias fcd="cd (fd . --type directory --hidden --exclude .cache --exclude .git --exclude node_modules | fzf --height=70% --border-label '| Find Directory |' --preview='eza --tree --level=1 -a --color auto --icons {}')"

### ALIASES

# X11
alias xx='xinit'

# zellij
alias z='zellij'

# tmux
alias t='tmux'

# nix flake
alias f='nix develop --command fish'

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
alias reb="doas reboot"
alias poff="doas poweroff"
alias g="glances"
alias lsi="eza --long --header --changed --total-size --git --icons=auto --color=auto --all"
alias ll="eza --long --header --changed --git --icons=auto --color=auto --all"
alias lt="eza --tree --level=3 -a --color=auto --icons=auto"

# python
alias py3="python3.9"
alias py="python"

# backup config files to git
alias cong="py /home/lk/nix_conf/scripts/git_conf.py"

# programs
alias lgi="lazygit"
# docker
alias ldo="lazydocker"
alias dc="docker container"
# freebsd
alias ap="doas appjail"
alias ba="doas bastille"
alias pot="doas pot"
alias vm="doas vm"

# bat
alias bat="bat -p --color always --theme gruvbox-dark"

# weather
alias wt="curl wttr.in"
# cheat sheet
alias cs="~/configs/scripts/cht.sh"

# ssh
alias dsh="ssh -i ~/.ssh/lap"
alias fu="dsh lk@192.168.1.103"
alias na="dsh lk@192.168.1.112"

# NFS
alias media="doas mount -t nfs 192.168.1.103:/export/photos /mnt/photos ;
doas mount -t nfs 192.168.1.103:/export/coding /mnt/dev"
alias nas="doas mount -t nfs 192.168.1.112:/volume2/export /mnt/nas"
alias um="doas umount /mnt/nas /mnt/photos /mnt/dev /mnt/exports"
. "$HOME/.cargo/env"
