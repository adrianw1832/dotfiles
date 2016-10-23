# Bind ctrl space to go back to background job
easier_ctrl-z() {
  if [[ $#BUFFER -eq 0 ]]; then
    BUFFER="fg"
    zle accept-line
  else
    zle push-input
    zle clear-screen
  fi
}
zle -N easier_ctrl-z
bindkey '^ ' easier_ctrl-z

# Custom function to handle git add and commit
gac() { git add "$1" && git commit }

# Custom function to handle git add, commit and push
gacp() { git add "$1" && git commit && git push }

# Always tmux is always running
_not_inside_tmux() { [[ -z "$TMUX" ]] }

ensure_tmux_is_running() {
  if _not_inside_tmux; then
    tat
  fi
}

ensure_tmux_is_running
