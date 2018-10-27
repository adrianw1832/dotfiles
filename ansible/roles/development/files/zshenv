# Mac OS X uses path_helper and /etc/paths.d to preload PATH, clear it out first
if [ -x /usr/libexec/path_helper ]; then
    PATH=''
    eval `/usr/libexec/path_helper -s`
fi

# If rbenv is present, configure it for use
# Needed for neovim shell to load ruby linter
if which rbenv &> /dev/null; then
    eval "$(rbenv init -)"
fi

export PATH=$PATH:$HOME/bin
