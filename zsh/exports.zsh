export EDITOR='/usr/local/bin/nvim'
export SHELL='/usr/local/bin/zsh'
export PATH=$PATH:$HOME/bin
export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin

export LSCOLORS=Gxfxcxdxbxegedabagacad

# Use ripgrep as default search engine for fzf
export FZF_DEFAULT_COMMAND='rg --files'
export FZF_COMPLETION_TRIGGER='*'

export KEYTIMEOUT=1

# Load fzf into the shell
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
