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
# 

$env.config.buffer_editor = "hx"
$env.config.edit_mode = "vi"

$env.config.history = {
  file_format: sqlite
  max_size: 1000000
  sync_on_enter: true
  isolation: true
}

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
# alias reboot="doas reboot"
alias reboot = doas init 6
alias poff = doas poweroff
alias g = glances

# programs
alias lgi = lazygit
# freebsd
alias vm = doas vm
alias ba = doas bastille

# bat
alias bat = bat -p --color always --theme gruvbox-dark

$env.config.show_banner = false

mkdir ($nu.data-dir | path join "vendor/autoload")
starship init nu | save -f ($nu.data-dir | path join "vendor/autoload/starship.nu")
