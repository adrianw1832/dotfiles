# Basics
setopt no_beep # don't beep on error

# Changing Directories
setopt auto_cd # If you type foo, and it isn't a command, and it is a directory in your cdpath, go there
setopt cdablevarS # if argument to cd is the name of a parameter whose value is a valid directory, it will become the current directory
setopt pushd_ignore_dups # don't push multiple copies of the same directory onto the directory stack

# Expansion and Globbing
setopt extended_glob # treat #, ~, and ^ as part of patterns for filename generation

# History
setopt append_history # Allow multiple terminal sessions to all append to one zsh command history
setopt extended_history # save timestamp of command and duration
setopt hist_expire_dups_first # when trimming history, lose oldest duplicates first
setopt hist_ignore_all_dups # Do not write events to history that are duplicates of previous events
setopt hist_ignore_space # remove command line from history list when first character on the line is a space
setopt hist_reduce_blanks # Remove extra blanks from each command line being added to history
setopt share_history # imports new commands and appends typed commands to history

HISTFILE=$HOME/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

# Completion
# setopt always_to_end # When completing from the middle of a word, move the cursor to the end of the word
# setopt auto_menu # show completion menu on successive tab press. needs unsetop menu_complete to work
# setopt complete_in_word # Allow completion from within a word/phrase

# unsetopt menu_complete # do not autoselect the first completion entry

# Correction
setopt correct # spelling correction for commands
setopt correctall # spelling correction for arguments
