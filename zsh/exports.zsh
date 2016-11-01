export EDITOR='/usr/local/bin/vim'
export PATH=$PATH:$HOME/.rvm/bin:$HOME/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/git/bin
export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin

# Use ripgrep as default search engine for fzf
export FZF_DEFAULT_COMMAND='rg --files'
export FZF_COMPLETION_TRIGGER='*'

# Load fzf into the shell
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
# THIS MUST BE AT THE END OF THE FILE FOR JENV TO WORK!!!
[[ -s "/Users/awong/.jenv/bin/jenv-init.sh" ]] && source "/Users/awong/.jenv/bin/jenv-init.sh" && source "/Users/awong/.jenv/commands/completion.sh"
