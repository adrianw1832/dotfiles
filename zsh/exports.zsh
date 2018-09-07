export EDITOR='/usr/local/bin/nvim'
export KEYTIMEOUT=1
export LSCOLORS=Gxfxcxdxbxegedabagacad
export N_PREFIX=$HOME
export SHELL='/usr/local/bin/zsh'
export WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'

export FZF_DEFAULT_OPTS='--height 40% --reverse --border'
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow -g "!{.git,node_modules}/*" 2> /dev/null'
# export FZF_DEFAULT_COMMAND='ag -l --follow'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# Remove duplicate entries
typeset -U PATH
