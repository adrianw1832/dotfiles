# Use modern completion system
autoload -U compinit
compinit
zmodload -i zsh/complist

zstyle ':completion:*' menu select
# case-insensitive (all), partial-word and then substring completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' list-colors ''
