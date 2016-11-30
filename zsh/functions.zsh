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

# Show all the modified files in the editor
dirty() {
  git status | grep modified | awk '{print $2}' | xargs $EDITOR
}

# Custom function to handle git add and commit
gac() { git add "$1" && git commit }
compdef _git gac=git-add

# Custom function to handle git add, commit and push
gacp() { git add "$1" && git commit && git push }
compdef _git gacp=git-add

# Custom function to handle git diff, for an optional argument
gd() { git diff --color=always "${1:-.}" | diff-so-fancy | less -CGR }
compdef _git gd=git-diff

# Pass git log to fzf and can check the diff of the commit object
glog() {
  gitlog "$@" | fzf --ansi --exact --no-sort --reverse --tiebreak=index \
    --bind "ctrl-m:execute:
             (grep -o '[a-f0-9]\{7\}' | head -1 |
             xargs -I % sh -c 'git show --color=always % | diff-so-fancy | less -CGR') << 'FZF-EOF'
             {}
             FZF-EOF"
}

# Get the commit sha - example usage: git rebase -i `fcs`
fcs() {
  local commits commit
  commits=$(gitlog) &&
    commit=$(echo "$commits" | fzf --ansi --exact --no-sort --reverse --tiebreak=index) &&
    echo -n $(echo "$commit" | awk '{print $2}')
}

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

jj() {
  local dir
  dir="$(fasd -Rdl "$1" | fzf -1 -0 --no-sort +m)" && cd "${dir}" || return 1
}

vv() {
  local file
  file="$(fasd -Rfl "$1" | fzf -1 -0 --no-sort +m)" && $EDITOR "${file}" || return 1
}
