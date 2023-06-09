alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

export STARSHIP_CONFIG=~/.config/starship/starship.toml
export PATH=$PATH:"~/bin"

eval "$(starship init bash)"
