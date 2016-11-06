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

# Custom function to display the path in a better way
path() {
  echo $PATH | tr ":" "\n" | \
    awk "{ sub(\"/usr\",     \"$fg_no_bold[green]/usr$reset_color\"); \
           sub(\"/bin\",     \"$fg_no_bold[blue]/bin$reset_color\"); \
           sub(\"/opt\",     \"$fg_no_bold[cyan]/opt$reset_color\"); \
           sub(\"/sbin\",    \"$fg_no_bold[magenta]/sbin$reset_color\"); \
           sub(\"/local\",   \"$fg_no_bold[yellow]/local$reset_color\"); \
           sub(\"/.nvm\",    \"$fg_no_bold[green]/.nvm$reset_color\"); \
           sub(\"/.rvm\",    \"$fg_no_bold[red]/.rvm$reset_color\"); \
           sub(\"/.rbenv\",  \"$fg_no_bold[red]/.rbenv$reset_color\"); \
           print }"
}

# Custom function to display the env in a better way
env() {
  printenv | \
    awk "{ sub(\"=\", \"$fg_no_bold[red]=$reset_color\"); \
           print }"
}

# Ensure tmux is always running
_not_inside_tmux() { [[ -z "$TMUX" ]] }

ensure_tmux_is_running() {
  if _not_inside_tmux; then
    tat
  fi
}

ensure_tmux_is_running
