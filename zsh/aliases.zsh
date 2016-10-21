# OS/ Shell {{{

# Easier navigation
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

# Hidden files
alias show="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias hide="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"

# Clear
alias c='clear'

# Ls
alias l='ls -AGFh'
alias ls='ls -AGFh'
alias ll='ls -Alh'

# Get OS software updates, and update installed packages of homebrew, cask, npm, bower and Ruby gems
alias update='softwareupdate -i -a; brew update; brew upgrade; brew cleanup; brew cask cleanup; npm install npm -g; npm install bower -g; npm update -g; npm cache clean; bower update; bower cache clean; rvm cleanup all; gem update --system; gem update; gem cleanup; zplug update; zplug clear'

# Reload the shell
alias reload="source ~/.zshrc"

# Copy the working directory path
alias cpwd='pwd|tr -d "\n"|pbcopy'

# Lock the screen (when going AFK)
alias afk="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"

# Stopwatch
alias timer='echo "Timer started. Stop with Ctrl-D." && date && time cat && date'
# }}}
# Apps# {{{

# Cask
alias cask="brew cask"

# Fasd
alias j='fasd_cd -d'
alias jj='fasd_cd -d -i'

#Source Tree
alias st="open -a SourceTree"

# Open intellij
alias ij="open -b com.jetbrains.intellij"
# }}}
# Config and editor# {{{

# Config shortcuts
alias za="vim ~/dotfiles/zsh/aliases.zsh; source ~/dotfiles/zsh/aliases.zsh"
alias ze="vim ~/dotfiles/zsh/exports.zsh; source ~/dotfiles/zsh/exports.zsh"
alias zf="vim ~/dotfiles/zsh/functions.zsh; source ~/dotfiles/zsh/functions.zsh"
alias zshrc="vim ~/dotfiles/zshrc; source ~/dotfiles/zshrc"
alias prompt="vim ~/dotfiles/zsh/powerline.zsh-theme; source ~/dotfiles/zsh/powerline.zsh-theme"
alias gitconf="vim ~/dotfiles/gitconfig"
alias tc="vim ~/dotfiles/tmux.conf"
alias tpo="vim ~/dotfiles/tmux-powerline/tmux-powerlinerc"
alias tpp="vim ~/dotfiles/tmux-powerline/tmux-powerline-theme.sh"
alias va="vim ~/dotfiles/abbreviations.vim"
alias vimrc="vim ~/dotfiles/vimrc"

# Editor shortcut
alias v="vim"
alias vv='f -e vim'
# }}}
# Git# {{{

alias amend="git commit --amend"
alias g="git status -s"
alias ga="git add"
alias gb="git branch -a"
alias gc="git commit"
alias gcl="git clone"
alias gclean="git clean -fd"
alias gco="git checkout"
alias gd="git diff"
alias gg="git open"
alias glog="git log --pretty=format:\"%h %ad | %s%d [%an]\" --graph --date=short"
alias gp="git push"
alias gacp="git add . && git commit && git push"
alias gpf="git push -f"
alias gpl="git pull"
alias gpr="git pull --rebase"
alias grc="git rebase --continue"
alias gs="git status"
# }}}
# Rails# {{{

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
# }}}
# Npm# {{{

alias npmg="npm install -g"
alias npmd="npm install -D"
alias npms="npm install -S"
alias npml="npm list"
alias npmo="npm outdated"
alias npmv="npm -version"
alias npmst="npm start"
alias npmt="npm test"
alias npmisreact="npm install -S babel-core babel-loader babel-plugin-add-module-exports babel-plugin-react-html-attrs babel-plugin-transform-class-properties babel-plugin-transform-decorators-legacy babel-preset-es2015 babel-preset-react babel-preset-stage-0 react react-dom webpack webpack-dev-server
"
# }}}
