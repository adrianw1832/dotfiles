# Mac OS X uses path_helper and /etc/paths.d to preload PATH, clear it out first
if [ -x /usr/libexec/path_helper ]; then
    PATH=''
    eval `/usr/libexec/path_helper -s`
fi

# Overload the colour palette to ensure correct gruvbox colours
source ~/.config/nvim/plugged/gruvbox/gruvbox_256palette.sh
