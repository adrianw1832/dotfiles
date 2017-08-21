# Custom function to go back to background job# {{{
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
# }}}
# Show all the modified files in the editor# {{{
dirty() {
  git status | grep modified | awk '{print $2}' | xargs $EDITOR
}
# }}}
# Get latest from master and then rebase master on current branch# {{{
grbm() {
  local currentbranch=$(git branch | grep \* | cut -d ' ' -f2)
  git checkout master
  git pull --rebase --prune
  git checkout $currentbranch
  git rebase master
}
# }}}
# Git add adds all if no arguments are specified# {{{
ga() { git add "${1:-.}" }
compdef _git ga=git-add
# }}}
# Git add and then commit# {{{
gac() { git add "${1:-.}" && git commit --verbose }
compdef _git gac=git-add
# }}}
# Git add, commit and then push# {{{
gacp() { git add "${1:-.}" && git commit && git push }
compdef _git gacp=git-add
# }}}
# Git show for all if no arugments are specified# {{{
gsh() { git show --color=always "${1:-.}" | diff-so-fancy | less -CGR }
compdef _git gd=git-show
# }}}
# Git diff for all if not arguments are specified# {{{
gd() { git diff --color=always "${1:-.}" | diff-so-fancy | less -CGR }
compdef _git gd=git-diff
# }}}
# Custom git log and defaults to showing 15 results unless an argument is given# {{{
glog() {
  git log --color=always --date=format:%a\ %H:%M\ %d-%m-%Y --format=log "${1:--15}"
}
# }}}
# Pass git log to fzf and can check the diff of the commit object# {{{
gitlog() {
  glog "${1:---all}" | fzf --ansi --exact --no-sort --reverse --tiebreak=index \
    --bind "ctrl-m:execute:
            (grep -o '[a-f0-9]\{7\}' |
            xargs -I % sh -c 'git show --color=always % | diff-so-fancy | less -CGR') << 'FZF-EOF'
            {}
            FZF-EOF"
}
# }}}
# Custom ref log and defaults to showing 15 results unless an argument is given# {{{
rlog() {
  git reflog --format=reflog "${1:--15}"
}
# }}}
# Pass ref log to fzf# {{{
reflog() {
  rlog "${1:--250}" | fzf --ansi --exact --no-sort --reverse --tiebreak=index \
    | grep -o 'HEAD@{\d\+}' | xargs git checkout
}
# }}}
# Get the commit sha - example usage: git rebase -i `fcs`# {{{
fcs() {
  glog "${1:---all}" | fzf --ansi --exact --no-sort --reverse --tiebreak=index \
    | grep -o '[a-f0-9]\{7\}'
}
# }}}
# Git push sets up origin if it is not already set, otherwise normal git push# {{{
gp() {
  local branch=$(git rev-parse --abbrev-ref HEAD)
  local remote=$(git config branch.$branch.merge)
  [[ $remote = '' ]] && git push -u origin $branch || git push
}
compdef _git gp=git-push
# }}}
# Find all local branches that are merged except for master and dev(elop) and delete them# {{{
deletelocalmergedbranches() {
  git branch --merged | egrep -v "(^\*|master|develop|dev)" | xargs git branch -d
}
# }}}
# Delete both the local and remote branch# {{{
deletelocalandremotebranch() {
  git branch -d $1 && git push -d origin $1
}
compdef _git deletebranch=git-branch
# }}}
# Smarter backwards cd# {{{
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
# }}}
# Display paths in a better way# {{{
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
# }}}
# Display env in a better way# {{{
env() {
  printenv | \
    awk "{ sub(\"=\", \"$fg_no_bold[red]=$reset_color\"); \
    print }"
}
# }}}
# Passing fasd directories to fzf# {{{
jj() {
  local dir
  dir="$(fasd -Rdl "$1" | fzf -1 -0 --no-sort +m)" && cd "${dir}" || return 1
}
# }}}
# Passing fasd files to fzf# {{{
vv() {
  local file
  file="$(fasd -Rfl "$1" | fzf -1 -0 --no-sort +m)" && $EDITOR "${file}" || return 1
}
# }}}
