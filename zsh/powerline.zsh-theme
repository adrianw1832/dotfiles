POWERLEVEL9K_MODE='awesome-patched'

POWERLEVEL9K_SHORTEN_DIR_LENGTH=5

POWERLEVEL9K_OS_ICON_FOREGROUND="254"
POWERLEVEL9K_OS_ICON_BACKGROUND="black"

POWERLEVEL9K_DIR_HOME_FOREGROUND="254"
POWERLEVEL9K_DIR_HOME_BACKGROUND="blue"
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND="254"
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND="blue"
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND="254"
POWERLEVEL9K_DIR_DEFAULT_BACKGROUND="blue"

POWERLEVEL9K_VCS_CLEAN_FOREGROUND='black'
POWERLEVEL9K_VCS_CLEAN_BACKGROUND='green'
POWERLEVEL9K_VCS_MODIFIED_FOREGROUND='black'
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='yellow'
POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND='black'
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND='red'

POWERLEVEL9K_TIME_FOREGROUND='black'
POWERLEVEL9K_TIME_BACKGROUND='247'
POWERLEVEL9K_TIME_FORMAT="%D{\UE12E %H:%M}"

POWERLEVEL9K_VI_MODE_INSERT_BACKGROUND='39'
POWERLEVEL9K_VI_MODE_INSERT_FOREGROUND='black'
POWERLEVEL9K_VI_MODE_NORMAL_BACKGROUND='154'
POWERLEVEL9K_VI_MODE_NORMAL_FOREGROUND='black'

POWERLEVEL9K_STATUS_VERBOSE=false

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context os_icon dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status background_jobs vi_mode time)

DEFAULT_USER=$USER

# Temporary code to enable the prompt# {{{
function zle-line-init {
  powerlevel9k_prepare_prompts
  if (( ${+terminfo[smkx]} )); then
    printf '%s' ${terminfo[smkx]}
  fi
  zle reset-prompt
  zle -R
}

function zle-line-finish {
  powerlevel9k_prepare_prompts
  if (( ${+terminfo[rmkx]} )); then
    printf '%s' ${terminfo[rmkx]}
  fi
  zle reset-prompt
  zle -R
}

function zle-keymap-select {
  powerlevel9k_prepare_prompts
  zle reset-prompt
  zle -R
}

zle -N zle-line-init
zle -N ale-line-finish
zle -N zle-keymap-select
# }}}
