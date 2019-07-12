# Rbenv{{{
# If rbenv is present, configure it for use
if which rbenv &> /dev/null; then
    eval "$(rbenv init -)"
fi
# }}}
# Gruvbox{{{
source ~/.config/nvim/plugged/gruvbox/gruvbox_256palette.sh
# }}}
# Source custom zsh files{{{
for file in ~/dotfiles/zsh/**/*; do
    source "$file"
done
# }}}
# Zplug plugins{{{
# Using zplug as plugin manager
source ~/.zplug/init.zsh

# Plugins
zplug "bhilburn/powerlevel9k", as:theme
zplug "djui/alias-tips"
zplug "hlissner/zsh-autopair"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load
# }}}
# Load plugins{{{
eval "$(fasd --init auto)"``
source ~/.fzf.zsh
eval $(thefuck --alias)
# }}}
# Powerlevel9k{{{
# Patching powerlevel9k so that it shows detached head state
source ~/dotfiles/zsh/detached.plugin.zsh
# }}}
