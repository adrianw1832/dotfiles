function +vi-git-remotebranch() {
  local remote branch_name

  # Are we on a remote-tracking branch?
  remote=${$(git rev-parse --verify HEAD@{upstream} --symbolic-full-name 2>/dev/null)/refs\/(remotes|heads)\/}
  branch_name=$(git rev-parse --abbrev-ref HEAD 2> /dev/null)

  # Show whether we are detached or not
  if [[ "${branch_name}" == "HEAD" ]]; then
    hook_com[branch]="  ${hook_com[branch]}"
  else
    hook_com[branch]="$(print_icon 'VCS_BRANCH_ICON')${hook_com[branch]}"
  fi

  # Only show the remote if it differs from the local
  if [[ -n ${remote} ]] && [[ "${remote#*/}" != "${branch_name}" ]] ; then
      hook_com[branch]+="$(print_icon 'VCS_REMOTE_BRANCH_ICON')${remote// /}"
  fi
}
