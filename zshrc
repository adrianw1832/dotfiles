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

# Setting for fasd to work
eval "$(fasd --init auto)"``

export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin
export PATH=$PATH:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/git/bin:$HOME/.rvm/bin:$HOME/bin

#THIS MUST BE AT THE END OF THE FILE FOR JENV TO WORK!!!
[[ -s "/Users/awong/.jenv/bin/jenv-init.sh" ]] && source "/Users/awong/.jenv/bin/jenv-init.sh" && source "/Users/awong/.jenv/commands/completion.sh"
