# Makes new Dir and jumps inside
mcd () { mkdir -p "$1" && cd "$1"; }

# Git flow, setting up branch and creating its remote
waffle () { git checkout -b "$1" && git push -u origin "$1"; }

easier_ctrl-z () {
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

# Always tmux
_not_inside_tmux() { [[ -z "$TMUX" ]] }

ensure_tmux_is_running() {
  if _not_inside_tmux; then
    tat
  fi
}

ensure_tmux_is_running
