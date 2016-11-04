source ~/.zsh/custom/powerline.zsh-theme

# Using zplug as plugin manager
source ~/.zplug/init.zsh

# Plugins
# zplug "plugins/rvm", from:oh-my-zsh
zplug "bhilburn/powerlevel9k"
zplug "djui/alias-tips"
zplug "lukechilds/zsh-nvm"
zplug "zplug/zplug"
zplug "zsh-users/zsh-autosuggestions"

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load --verbose

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

# Setting for fasd to work
eval "$(fasd --init auto)"``

# Source custom zsh files
for file in ~/dotfiles/zsh/*.zsh; do
    source "$file"
done
