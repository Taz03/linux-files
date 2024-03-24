# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd extendedglob nomatch notify
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install

# The following lines were added by compinstall
zstyle :compinstall filename '/home/taz/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

alias ls="ls --color=auto"

export STARSHIP_CONFIG=~/.config/starship/starship.toml
eval "$(starship init zsh)"

fpath=(~/.zsh/gradle-completion $fpath)
