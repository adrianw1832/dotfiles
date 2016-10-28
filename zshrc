export EDITOR='/usr/local/bin/vim'
export PATH=$PATH:$HOME/.rvm/bin:$HOME/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/git/bin
export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin

source ~/.zsh/custom/powerline.zsh-theme

# Using zplug as plugin manager
source ~/.zplug/init.zsh

# Plugins
zplug "bhilburn/powerlevel9k"
zplug "djui/alias-tips"
zplug "lib/*", from:oh-my-zsh
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

# Source custom zsh files
for file in ~/dotfiles/zsh/*.zsh; do
    source "$file"
done

# Enable vi mode
bindkey -v
export KEYTIMEOUT=1

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

# Enable autocorrection prompt
setopt correct

# Setting for fasd to work
eval "$(fasd --init auto)"``

# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
# THIS MUST BE AT THE END OF THE FILE FOR JENV TO WORK!!!
[[ -s "/Users/awong/.jenv/bin/jenv-init.sh" ]] && source "/Users/awong/.jenv/bin/jenv-init.sh" && source "/Users/awong/.jenv/commands/completion.sh"
