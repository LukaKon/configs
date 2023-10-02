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

# fzf
set -gx FZF_DEFAULT_OPTS "--layout reverse --height=15 --extended --multi --cycle --border rounded --prompt='▶' --pointer='' --marker='' --color fg:#ebdbb2,bg:#282828,hl:#fabd2f,fg+:#ebdbb2,bg+:#3c3836,hl+:#fabd2f --color info:#83a598,prompt:#bdae93,spinner:#fabd2f,pointer:#83a598,marker:#fe8019,header:#665c54"

# set -gx FZF_DEFAULT_COMMAND "fd --type f --color=never --hidden"
set -gx FZF_DEFAULT_COMMAND 'find . \! -name ".git/"'

#set -gx FZF_CTRL_T_COMMAND "
#  --preview 'bat -n --color=always {}'
#  --bind 'ctrl-/:change-preview-window(down|hidden|)'"

# CTRL-/ to toggle small preview window to see the full command
# CTRL-Y to copy the command into clipboard using pbcopy
#set -gx FZF_CTRL_R_OPTS "
#  --preview 'echo {}' --preview-window up:3:hidden:wrap
#  --bind 'ctrl-/:toggle-preview'
#  --bind 'ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort'
#  --color header:italic
#  --header 'Press CTRL-Y to copy command into clipboard'"

# Print tree structure in the preview window
#set -gx FZF_ALT_C_COMMAND "--preview 'tree -C {}'"

alias fz="fzf --hidden --multi --layout reverse --border rounded --border-label 'FZ' --border-label-pos 5 --preview-window right --preview 'bat -n --color=always {}' --bind 'enter:execute($EDITOR {})'"

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

# bat
alias bat="bat -p --color always --theme gruvbox-dark"

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
