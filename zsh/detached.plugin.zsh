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

function +vi-git-tagname() {
    if [[ "$POWERLEVEL9K_VCS_HIDE_TAGS" == "false" ]]; then
        # If we are on a tag, append the tagname to the current branch string.
        local tag
        tag=$(git describe --tags --exact-match HEAD 2>/dev/null)

        if [[ -n "${tag}" ]] ; then
            # There is a tag that points to our current commit. Need to determine if we
            # are also on a branch, or are in a DETACHED_HEAD state.
            if [[ -z $(git symbolic-ref HEAD 2>/dev/null) ]]; then
                # DETACHED_HEAD state. We want to append the tag name to the commit hash
                # and print it. Unfortunately, `vcs_info` blows away the hash when a tag
                # exists, so we have to manually retrieve it and clobber the branch
                # string.
                local revision
                revision=$(git rev-list -n 1 --abbrev-commit --abbrev=${POWERLEVEL9K_VCS_INTERNAL_HASH_LENGTH} HEAD)
                hook_com[branch]="  ${revision} $(print_icon 'VCS_TAG_ICON') ${tag}"
            else
                # We are on both a tag and a branch; print both by appending the tag name.
                hook_com[branch]+=" $(print_icon 'VCS_TAG_ICON') ${tag}"
            fi
        fi
    fi
}
