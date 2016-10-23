# Vi mode keybinds
bindkey -M viins 'jk' vi-cmd-mode
bindkey -M viins 'kj' vi-cmd-mode

bindkey -M viins '^o' autosuggest-execute
bindkey -M viins '^p' up-line-or-beginning-search
bindkey -M viins '^n' down-line-or-beginning-search

bindkey -M viins '^b' backward-char
bindkey -M viins '^f' forward-char

bindkey -M viins '^d' delete-char
bindkey -M viins '^g' backward-delete-char
# bindkey -M viins '^h' backward-delete-char # It's blocked by tmux navigator

bindkey -M viins '^r' history-incremental-search-backward
bindkey -M viins '^t' history-incremental-search-forward

bindkey -M vicmd 'Y' vi-yank-eol

bindkey -M vicmd 'v' visual-mode
bindkey -M vicmd 'V' visual-line-mode

# Emacs-like keybinds
# bindkey '^w' forward-word
# bindkey '^b' backward-word
# bindkey '^o' autosuggest-execute
# bindkey '^p' up-line-or-beginning-search
# bindkey '^n' down-line-or-beginning-search
# bindkey '^xw' kill-word
# bindkey '^xb' backward-kill-word
