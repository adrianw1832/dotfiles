# Vi mode keybinds
bindkey -M viins 'jk' vi-cmd-mode
bindkey -M viins 'kj' vi-cmd-mode

bindkey -M viins '^o' autosuggest-execute
bindkey -M viins '^p' up-line-or-beginning-search
bindkey -M viins '^n' down-line-or-beginning-search

bindkey -M viins '^a' beginning-of-line
bindkey -M viins '^e' end-of-line
bindkey -M viins '^k' kill-line
bindkey -M viins '^u' backward-kill-line

bindkey -M viins '^b' backward-char
bindkey -M viins '^f' forward-char

bindkey -M viins '^d' delete-char
bindkey -M viins '^h' backward-delete-char

# [Shift-Tab] - move through the completion menu backwards
if [[ "${terminfo[kcbt]}" != "" ]]; then
  bindkey "${terminfo[kcbt]}" reverse-menu-complete
fi

bindkey -M viins '^ ' _easier_ctrl-z

# bindkey -M viins '^r' history-incremental-pattern-search-backward
# bindkey -M viins '^t' history-incremental-pattern-search-forward

bindkey -M viins '^w' forward-word
bindkey -M viins '^v' copy-prev-shell-word

bindkey -M vicmd 'Y' vi-yank-eol

bindkey -M vicmd 'v' visual-mode
bindkey -M vicmd 'V' edit-command-line
