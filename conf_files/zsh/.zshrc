# Lines configured by zsh-newuser-install
export EDITOR=nvim
export VISUAL=nvim

export PATH=~/.npm-packages/bin:$PATH
export NODE_PATH=~/.npm-packages/lib/node_modules

# Aliases
alias la='ls -lah'

# git
alias gs="git status -s"
alias   ga="git add"
alias gc="git commit"
alias gp="git push"
alias gpull="git pull"
alias gb="git branch"
alias gch="git checkout"
alias gm="git merge"
alias gf="git fetch"
alias glog="git log --graph --pretty=oneline --abbrev-commit"

# term
alias susp="systemctl suspend"
alias reboot="doas reboot"
alias poff="doas poweroff"

# python
alias py="python"

# backup config files to git
alias cong="py /home/lk/configs/scripts/git_conf.py"

# docker
alias dc="docker container"

# programs
alias lgi="lazygit"
alias ldo="lazydocker"

# nvim
alias vi="nvim"

# kitty
alias icat="kitty +kitten icat"
alias d="kitty +kitten diff"
# End of aliases

HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
unsetopt beep

# vi key binding
bindkey -v
unsetopt beep

# Editor
autoload -z edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line

# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/lk/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# git
autoload -Uz add-zsh-hook vcs_info
# Enable substitution in the prompt
setopt prompt_subst
# Run vcs_info before a prompt is displayed (precmd)
add-zsh-hook precmd vcs_info

PROMPT='%F{033}%B%m%b %F{green}${vcs_info_msg_0_}%f >> %F{087} '
RPROMPT='%f[%?] %*'

# Enable checking for (un)staged changes, enabling use of %u and %c
zstyle ':vcs_info:*' check-for-changes true
# Set custom strings for an unstaged vcs repo changes (*) and staged changes (+)
zstyle ':vcs_info:*' unstagedstr ' *'
zstyle ':vcs_info:*' stagedstr ' +'
# Set the format of the Git information for vcs_info
zstyle ':vcs_info:git:*' formats       '(%b%u%c)'
zstyle ':vcs_info:git:*' actionformats '(%b|%a%u%c)'
