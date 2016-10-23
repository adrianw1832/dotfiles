# Custom function to go back to background job
_easier_ctrl-z() {
  if [[ $#BUFFER -eq 0 ]]; then
    BUFFER="fg"
    zle accept-line
  else
    zle push-input
    zle clear-screen
  fi
}
zle -N _easier_ctrl-z

# Custom function to handle git add and commit
gac() { git add "$1" && git commit }

# Custom function to handle git add, commit and push
gacp() { git add "$1" && git commit && git push }

# Custom function to allow smarter backwards cd
up() {
  local op=print
  [[ -t 1 ]] && op=cd
  case "$1" in
    '') up 1;;
    -*|+*) $op ~$1;;
    <->) $op $(printf '../%.0s' {1..$1});;
    *) local -a seg; seg=(${(s:/:)PWD%/*})
       local n=${(j:/:)seg[1,(I)$1*]}
       if [[ -n $n ]]; then
         $op /$n
       else
         print -u2 up: could not find prefix $1 in $PWD
         return 1
       fi
  esac
}

# Ensure tmux is always running
_not_inside_tmux() { [[ -z "$TMUX" ]] }

ensure_tmux_is_running() {
  if _not_inside_tmux; then
    tat
  fi
}

ensure_tmux_is_running
