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

# Cask
alias cask="brew cask"

#Source Tree
alias st="open -a SourceTree"

# Ls
alias l='ls -AGFh'
alias ls='ls -AGFh'

# Tmux
alias tl='tmux ls'
alias tk='tmux kill-session -t'
alias trs='tmux rename-session'
alias trw='tmux rename-window'

# Stopwatch
alias timer='echo "Timer started. Stop with Ctrl-D." && date && time cat && date'

# Get OS software updates, and update installed packages of homebrew, cask, npm, bower and Ruby gems
alias update='softwareupdate -i -a; brew update; brew upgrade; brew cleanup; brew cask cleanup; npm install npm -g; npm install bower -g; npm update -g; npm cache clean; bower update; bower cache clean; rvm cleanup all; gem update --system; gem update; gem cleanup'

# Bundle
alias bi="bundle install"

# NPM
alias nis="npm install -S"
alias nig="npm install -g"
alias npmisreact="npm install -S babel-core babel-loader babel-plugin-add-module-exports babel-plugin-react-html-attrs babel-plugin-transform-class-properties babel-plugin-transform-decorators-legacy babel-preset-es2015 babel-preset-react babel-preset-stage-0 react react-dom webpack webpack-dev-server
"

# Rails
alias rsetup="ruby ~/dotfiles/rails_setup.rb"
alias rr="bin/rake routes"
alias rdbc="bin/rake db:create && bin/rake db:create RAILS_ENV=test"
alias rdbd="bin/rake db:drop"
alias rdbm="bin/rake db:migrate"
alias rdbmt="bin/rake db:migrate RAILS_ENV=test"
alias rdbrb="bin/rake db:rollback"
alias rdbr="bin/rake db:reset"
alias rs="bin/rails server --binding=127.0.0.1"
alias rc="bin/rails console"
alias rgrspec="bin/rails generate rspec:install"
alias rgc="bin/rails generate controller"
alias devise="bin/rails generate devise:install && bin/rails generate devise User && bin/rake db:migrate"
alias rdc="bin/rails destroy controller"
alias rgmo="bin/rails generate model"
alias rdmo="bin/rails destroy model"
alias rgmi="bin/rails generate migration"
alias rdmi="bin/rails destroy migration"

# Copy the working directory path
alias cpwd='pwd|tr -d "\n"|pbcopy'

# Editor shortcut
alias v="vim"
alias vv='f -e vim'

# Fasd
alias j='fasd_cd -d'
alias jj='fasd_cd -d -i'

# Config Shortcuts
alias za="vim ~/dotfiles/zsh/aliases.zsh; source ~/dotfiles/zsh/aliases.zsh"
alias ze="vim ~/.oh-my-zsh/custom/exports.zsh; source ~/.oh-my-zsh/custom/exports.zsh"
alias zf="vim ~/dotfiles/zsh/functions.zsh; source ~/dotfiles/zsh/functions.zsh"
alias zshrc="vim ~/dotfiles/zsh/zshrc; source ~/dotfiles/zsh/zshrc"
alias gitconf="vim ~/dotfiles/gitconfig"
alias tc="vim ~/dotfiles/tmux.conf"
alias va="vim ~/dotfiles/abbreviations.vim"
alias vimrc="vim ~/dotfiles/vimrc"

# Testing Angular
alias wds="webdriver-manager start"
alias e2e="gulp e2e"
alias test="gulp test"

# Webpack dev server
alias webpackdevserver="webpack-dev-server --content-base src --inline --hot"

# Git
alias amend="git commit --amend"
alias g="git status -s"
alias ga="git add"
alias gb="git branch -a"
alias gc="git commit"
alias gcl="git clone"
alias gg="git open"
alias glog="git log --pretty=format:\"%h %ad | %s%d [%an]\" --graph --date=short"
alias go="git checkout"
alias gp="git push"
alias gpa="git add . && git commit && git push"
alias gpl="git pull origin"
alias gpo="git push -u origin"
alias gpr="git pull --rebase"
alias gs="git status"
alias grc="git rebase --continue"

# Reload the shell
alias reload="exec $SHELL -l"

# Lock the screen (when going AFK)
alias afk="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"

# Open intellij
alias ij="open -b com.jetbrains.intellij"
