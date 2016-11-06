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

# Setting for fasd to work
eval "$(fasd --init auto)"``

# if rbenv is present, configure it for use
if which rbenv &> /dev/null; then
    # enable shims and auto-completion
    eval "$(rbenv init -)"
fi

# Source custom zsh files
for file in ~/dotfiles/zsh; do
    source "$file"
done
