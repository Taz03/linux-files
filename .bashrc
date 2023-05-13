# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

export STARSHIP_CONFIG=~/.config/starship/starship.toml
export GOBIN=~/bin
export PATH=$PATH:"~/bin"
export LD_LIBRARY_PATH="/usr/lib/libcuda.so"
eval "$(starship init bash)"

# Load Angular CLI autocompletion.
source <(ng completion script)
