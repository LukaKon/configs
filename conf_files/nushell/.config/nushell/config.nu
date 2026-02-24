# config.nu
#
# Installed by:
# version = "0.107.0"
#
# This file is used to override default Nushell settings, define
# (or import) custom commands, or run any other startup tasks.
# See https://www.nushell.sh/book/configuration.html
#
# Nushell sets "sensible defaults" for most configuration settings, 
# so your `config.nu` only needs to override these defaults if desired.
#
# You can open this file in your default editor using:
#     config nu
#
# You can also pretty-print and page through the documentation for configuration
# options using:
#     config nu --doc | nu-highlight | less -R
#
 

$env.config.buffer_editor = "hx"
$env.config.edit_mode = "vi"

$env.config.history = {
  file_format: sqlite
  max_size: 1000000
  sync_on_enter: true
  isolation: true
}

alias xx = startx

alias ll = ls --all --long
alias lsi = ls --all --long --du

alias t = tmux

# git
alias gs = git status -s
alias ga = git add
alias gc = git commit
alias gp = git push
alias gpull = git pull
alias gb = git branch
alias gch = git checkout
alias gm = git merge
alias gf = git fetch
alias glog = git log --graph --pretty = oneline --abbrev-commit

# term
alias reboot = doas init 6
alias poff = doas poweroff
alias py = python3

alias lsi = eza --long --header --changed --total-size --git --icons=auto --color=auto --all
alias ll = eza --long --header --group --changed --git --icons=auto --color=auto --all
alias lt = eza --tree --level=3 -a --color=auto --icons=auto
alias b = btm --battery --theme gruvbox --network_use_log --enable_cache_memory

# programs
alias lgi = lazygit
# docker
alias ldo = lazydocker
# freebsd
alias vm = doas vm
alias vml = doas vm list
# alias ba = doas bastille
# alias bal = doas bastille list
# alias bls = doas bastille list all
alias ap = doas appjail
alias apc = doas appjail-config
alias apl = appjail jail list status name type version ports network_ip4 ip4
alias anl = appjail network list

# bat
alias bat = bat -p --color always --theme gruvbox-dark

# programs
alias lgi = lazygit

# bat
alias bat = bat -p --color always --theme gruvbox-dark

$env.config.show_banner = false
