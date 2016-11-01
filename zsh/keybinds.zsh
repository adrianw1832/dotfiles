# Vi mode keybinds
bindkey -M viins 'jk' vi-cmd-mode
bindkey -M viins 'kj' vi-cmd-mode

bindkey -M viins '^o' autosuggest-execute
bindkey -M viins '^p' up-line-or-beginning-search
bindkey -M viins '^n' down-line-or-beginning-search

bindkey -M viins '^a' beginning-of-line
bindkey -M viins '^e' end-of-line

bindkey -M viins '^b' backward-char
bindkey -M viins '^f' forward-char

bindkey -M viins '^d' delete-char
bindkey -M viins '^b' backward-delete-char
bindkey -M viins '^w' backward-kill-word
# bindkey -M viins '^h' backward-delete-char # It's blocked by tmux navigator

# [Shift-Tab] - move through the completion menu backwards
if [[ "${terminfo[kcbt]}" != "" ]]; then
  bindkey "${terminfo[kcbt]}" reverse-menu-complete
fi

bindkey -M viins '^ ' _easier_ctrl-z

# bindkey -M viins '^r' history-incremental-pattern-search-backward
# bindkey -M viins '^t' history-incremental-pattern-search-forward

bindkey -M viins '^v' copy-prev-shell-word

bindkey -M vicmd 'Y' vi-yank-eol

bindkey -M vicmd 'v' visual-mode
bindkey -M vicmd 'V' edit-command-line

# Emacs-like keybinds
# bindkey '^w' forward-word
# bindkey '^b' backward-word
# bindkey '^o' autosuggest-execute
# bindkey '^p' up-line-or-beginning-search
# bindkey '^n' down-line-or-beginning-search
# bindkey '^xw' kill-word
# bindkey '^xb' backward-kill-word
