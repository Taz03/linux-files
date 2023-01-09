#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

export STARSHIP_CONFIG=~/.config/starship/starship.toml
eval "$(starship init bash)"

export FZF_DEFAULT_COMMAND='find . -printf "%P\\n"'
