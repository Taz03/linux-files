alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

export STARSHIP_CONFIG=~/.config/starship/starship.toml
export PATH=$PATH:"~/bin"

eval "$(starship init bash)"

GPG_TTY=$(tty)
export GPG_TTY

source /usr/share/bash-completion/completions/git
source /usr/share/bash-completion/completions/gradle
