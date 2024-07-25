export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="frontcube"

HYPHEN_INSENSITIVE="true"

zstyle ':omz:update' mode auto

zstyle ':omz:update' frequency 7

ENABLE_CORRECTION="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

plugins=(git gradle-completion zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# User configuration

if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR='vim'
else
    export EDITOR='nvim'
fi

bindkey -v

GPG_TTY=$(tty)
export GPG_TTY
