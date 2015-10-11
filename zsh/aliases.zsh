# Easier navigation
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

# Shortcuts
# alias d="cd ~/Documents/Dropbox"
alias dl="cd ~/Downloads"
alias dt="cd ~/Desktop"
alias p="cd ~/Desktop/projects"

# Hidden files
alias show="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias hide="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"

# Clear
alias c='clear'

#Source Tree
alias st="open -a SourceTree"

# Ls
alias ls='ls -AGFh'
export LSCOLORS=GxFxCxDxBxegedabagaced

#Tmux
alias tl='tmux ls'
alias tk='tmux kill-session -t'

# Stopwatch
alias timer='echo "Timer started. Stop with Ctrl-D." && date && time cat && date'

# Get OS X Software Updates, and update installed Ruby gems, Homebrew, npm, and their installed packages
alias update='softwareupdate -i -a; brew update; brew upgrade --all; brew cleanup; npm install npm -g; npm update -g; gem update --system; gem update'

# Rails
alias rr="bin/rake routes"
alias rdbc="bin/rake db:create"
alias rdbct="bin/rake db:create RAILS_ENV=test"
alias rdbd="bin/rake db:drop"
alias rdbm="bin/rake db:migrate"
alias rdbmt="bin/rake db:migrate RAILS_ENV=test"
alias rdbrb="bin/rake db:rollback"
alias rdbr="bin/rake db:reset"
alias rs="bin/rails server --binding=127.0.0.1"
alias rc="bin/rails console"
alias rgrspec="bin/rails generate rspec:install"
alias rgc="bin/rails generate controller"
alias rdc="bin/rails destroy controller"
alias rgmo="bin/rails generate model"
alias rdmo="bin/rails destroy model"
alias rgmi="bin/rails generate migration"
alias rdmi="bin/rails destroy migration"

# copy the working directory path
alias cpwd='pwd|tr -d "\n"|pbcopy'

# editor shortcut
alias v="vim"

# fasd
alias j='fasd_cd -d'
alias jj='fasd_cd -d -i'

#Config Shortcuts
alias za="vim ~/dotfiles/zsh/aliases.zsh"
alias ze="vim ~/.oh-my-zsh/custom/exports.zsh"
alias zf="vim ~/.oh-my-zsh/custom/functions.zsh"
alias zshrc="vim ~/dotfiles/zsh/zshrc"
alias vimrc="vim ~/dotfiles/vimrc"
alias gc="vim ~/.gitconfig"
alias tc="vim ~/dotfiles/tmux.conf"

#Testing Angular
alias wds="webdriver-manager start"
alias e2e="gulp e2e"
alias test="gulp test"

# Git
alias g="git status"
alias ga="git add ."
alias gc="git commit -m"
alias gp="git add . && git commit && git push"
alias go="git checkout"
alias amend="git commit --amend"

#Reload the shell
alias reload="exec $SHELL -l"

# Lock the screen (when going AFK)
alias afk="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"
