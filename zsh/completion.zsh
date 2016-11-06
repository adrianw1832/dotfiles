# Use modern completion system
autoload -U compinit && compinit
autoload -U colors ; colors
zmodload -i zsh/complist

# Show coloured menu when tabbing
zstyle ':completion:*' menu select
zstyle ':completion:*' list-colors 'di=1;36:ln=35:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43'

# Case-insensitive (all), partial-word and then substring completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# List of completers to use
zstyle ':completion:*' completer _expand _complete

# Formatting and messages
zstyle ':completion:*' extra-verbose true
zstyle ':completion:*:descriptions' format '%B%d%b'
zstyle ':completion:*:messages' format '%d'
zstyle ':completion:*:warnings' format 'No matches for: %d'
zstyle ':completion:*' group-name ''

# Enable completion caching, use rehash to clear
zstyle ':completion::complete:*' use-cache on
zstyle ':completion::complete:*' cache-path ~/.zsh/cache
