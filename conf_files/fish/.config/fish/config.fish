### EXPORT ###
set fish_greeting # Supresses fish's intro message
# set TERM "xterm-256color"                         # Sets the terminal type

### PROMPT
# function starship_transient_prompt_func
#   starship module character
# end
# starship init fish | source
# enable_transience

# function starship_transient_rprompt_func
#   starship module time
# end
# starship init fish | source
# enable_transience

fzf --fish | source

# yazi - file explorer
function yy
	set tmp (mktemp -t "yazi-cwd.XXXXXX")
	yazi $argv --cwd-file="$tmp"
	if set cwd (command cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
		cd -- "$cwd"
	end
	rm -f -- "$tmp"
end

# theme
set -g theme_color_scheme terminal-dark
set -g fish_prompt_pwd_dir_length 1
set -g theme_display_user yes
set -g theme_hide_hostname no
set -g theme_hostname always

set -gx EDITOR hx
set -gx BROWSER waterfox
set -gx DISPLAY :0

# fzf
set -gx FZF_DEFAULT_OPTS "--layout reverse --height=50% --extended --multi --cycle --border rounded --prompt='▶' --pointer='' --marker='' --color fg:#ebdbb2,bg:#282828,hl:#fabd2f,fg+:#ebdbb2,bg+:#3c3836,hl+:#fabd2f --color info:#83a598,prompt:#bdae93,spinner:#fabd2f,pointer:#83a598,marker:#fe8019,header:#665c54"

set -gx FZF_DEFAULT_COMMAND 'fd . --exclude .git --exclude node_modules --exclude target --hidden'

alias ff="fzf --multi --layout reverse --border rounded --border-label '| Find and edit file |' --border-label-pos 5 --preview-window right --preview 'bat -n --color=always {}' --bind 'enter:execute($EDITOR {})'"

alias fcd="cd (fd . --type directory --hidden --exclude .cache --exclude .git --exclude node_modules | fzf --height=70% --border-label '| Find Directory |' --preview='eza --tree --level=1 -a --color auto --icons {}')"

### ALIASES

# X11
alias xx='startx'

# tmux
alias tm='tmux new -s (pwd | sed "s/.*\///g")'
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
alias py="python3"
alias reboot="doas init 6"
alias poff="doas poweroff"
alias g="glances"
alias lsi="eza --long --header --changed --total-size --git --icons=auto --color=auto --all"
alias ll="eza --long --header --group --changed --git --icons=auto --color=auto --all"
alias lt="eza --tree --level=3 -a --color=auto --icons=auto"
alias b="btm --battery --theme gruvbox --network_use_log --enable_cache_memory"

# programs
alias lgi="lazygit"
# docker
alias ldo="lazydocker"
# freebsd
alias vm="doas vm"
alias po="doas podman"
alias ba="doas bastille"
alias bal="doas bastille list"
alias bls="doas bastille list all"
alias ap="doas appjail"
alias apc="doas appjail-config"
alias apl="appjail jail list status name type version ports network_ip4 ip4"
alias anl="appjail network list"
# toolbox
alias tb="toolbox"
alias tc="toolbox create"
alias te="toolbox enter"
# distrobox
alias db="distrobox"
alias dc="distrobox create"
alias de="distrobox enter"

# bat
alias bat="bat -p --color always --theme gruvbox-dark"

# weather
alias wt="curl wttr.in"
# cheat sheet
alias cs="~/configs/scripts/cht.sh"

# ytfzf
alias ytm="ytfzf -m --show-thumbnails --thumb-viewer=chafa --preview-side=right"
alias ytv="ytfzf --show-thumbnails --thumb-viewer=chafa --preview-side=right"


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
end
