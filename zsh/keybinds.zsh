# Enable vi mode
bindkey -v

# Vi mode keybinds
bindkey -M viins 'jk' vi-cmd-mode
bindkey -M viins 'kj' vi-cmd-mode

autoload -Uz up-line-or-beginning-search
zle -N up-line-or-beginning-search
bindkey -M viins '^p' up-line-or-beginning-search

autoload -Uz down-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey -M viins '^n' down-line-or-beginning-search

bindkey -M viins '^o' autosuggest-execute

bindkey -M viins '^a' beginning-of-line
bindkey -M viins '^e' end-of-line
bindkey -M viins '^k' kill-line
bindkey -M viins '^u' backward-kill-line

bindkey -M viins '^b' backward-char
bindkey -M viins '^f' forward-char

bindkey -M viins '^d' delete-char
bindkey -M viins '^h' backward-delete-char

bindkey -M viins '^ ' _easier_ctrl-z

bindkey -M viins '^g' forward-word
bindkey -M viins '^w' backward-delete-word
bindkey -M viins '^v' copy-prev-shell-word
bindkey -M viins '^y' insert-last-word

bindkey -M vicmd 'Y' vi-yank-eol

autoload -Uz edit-command-line
zle -N edit-command-line
bindkey -M vicmd '^v' edit-command-line

# [Shift-Tab] - move through the completion menu backwards
bindkey "${terminfo[kcbt]}" reverse-menu-complete

bindkey -M menuselect 'o' accept-and-infer-next-history

# Use vim navigation keys besides cursor keys in menu completion
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
