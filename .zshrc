export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="frontcube"

HYPHEN_INSENSITIVE="true"

zstyle ':omz:update' mode auto
zstyle ':omz:update' frequency 1

ENABLE_CORRECTION="true"

plugins=(git zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# User configuration

export EDITOR='nvim'

bindkey -v

GPG_TTY=$(tty)
export GPG_TTY
