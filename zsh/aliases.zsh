# OS/ Shell {{{

# Easier navigation
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

# Hidden files
alias show="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias hide="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"

# Ripgrep
alias -g G='| rg'

# Ls
alias l='ls -AGFh' # Colorize output, add file type indicator, and put sizes in human readable format
alias ls='ls -AGFh' # Colorize output, add file type indicator, and put sizes in human readable format
alias ll='ls -AGFhl' # Same as above, but in long listing format

# Get OS software updates, and update installed packages of homebrew, cask, npm, bower and Ruby gems
alias update='softwareupdate -i -a; brew update; brew upgrade; brew cleanup; brew cask cleanup; npm install npm -g; npm install bower -g; npm update -g; npm cache clean; bower update; bower cache clean; gem update --system; gem update; gem cleanup; zplug update; zplug clear'

# Reload the shell
alias reload='exec $SHELL -l'

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
# jj is mapped to a function integrated with fzf

#Source Tree
alias st="open -a SourceTree"

# Open intellij
alias ij="open -b com.jetbrains.intellij"
# }}}
# Config and editor# {{{

# Config shortcuts
alias gitconf="$EDITOR ~/dotfiles/gitconfig"
alias prompt="$EDITOR ~/dotfiles/zsh/powerline.zsh-theme; source ~/dotfiles/zsh/powerline.zsh-theme"
alias tc="$EDITOR ~/dotfiles/tmux.conf"
alias tpo="$EDITOR ~/dotfiles/tmux-powerline/tmux-powerlinerc"
alias tpp="$EDITOR ~/dotfiles/tmux-powerline/tmux-powerline-theme.sh"
alias va="$EDITOR ~/dotfiles/abbreviations.vim"
alias za="$EDITOR ~/dotfiles/zsh/aliases.zsh; source ~/dotfiles/zsh/aliases.zsh"
alias zc="$EDITOR ~/dotfiles/zsh/completion.zsh; source ~/dotfiles/zsh/completion.zsh"
alias ze="$EDITOR ~/dotfiles/zsh/exports.zsh; source ~/dotfiles/zsh/exports.zsh"
alias zf="$EDITOR ~/dotfiles/zsh/functions.zsh; source ~/dotfiles/zsh/functions.zsh"
alias zk="$EDITOR ~/dotfiles/zsh/keybinds.zsh; source ~/dotfiles/zsh/keybinds.zsh"
alias zs="$EDITOR ~/dotfiles/zsh/setopt.zsh; source ~/dotfiles/zsh/setopt.zsh"
alias zshrc="$EDITOR ~/dotfiles/zshrc; source ~/dotfiles/zshrc"
alias cvimrc="$EDITOR ~/dotfiles/cvimrc"
alias vimrc="$EDITOR ~/dotfiles/init.vim"
# alias vimrc="$EDITOR ~/dotfiles/vimrc"

# Editor shortcut
alias v="$EDITOR"
alias vv='f -e $EDITOR'
# }}}
# Git# {{{

alias amend="git commit --amend"
alias amendne="git commit --amend --no-edit"
alias g="git status -s"
alias ga="git add"
alias gb="git branch -a"
alias gc="git commit"
alias gcl="git clone"
alias gcn="git clean -fd"
alias gco="git checkout"
alias gcob="git checkout -b"
alias gd="git diff"
alias gdc="git diff --cached"
alias gdt="git difftool"
alias gdtc="git difftool --cached"
alias gf="git fetch"
alias glog="git log --pretty=format:\"%C(yellow)%h %C(magenta)| %C(green)%ad%  %C(magenta)|%C(reset) %s%d %C(magenta)<= %C(red)[%an]\" --graph --date=short"
alias gp="git push"
alias gpf="git push -f"
alias gpl="git pull"
alias gpr="git pull --rebase"
alias grc="git rebase --continue"
alias gri="git rebase --interactive"
alias grt="git reset"
alias grts="git reset --soft"
alias grth="git reset --hard"
alias gs="git status"
alias gsh="git stash"
alias gsha="git stash apply"
alias gshp="git stash pop"
alias gshd="git stash drop"
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
alias npmsreact="npm install -S babel-core babel-loader babel-plugin-add-module-exports babel-plugin-react-html-attrs babel-plugin-transform-class-properties babel-plugin-transform-decorators-legacy babel-preset-es2015 babel-preset-react babel-preset-stage-0 react react-dom webpack webpack-dev-server
"
# }}}
