# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:/usr/local/bin/rustc:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/Users/crs/.oh-my-zsh

# Theme
ZSH_THEME="dracula"

# Plugins
plugins=(fzf git git-extra z colorize zsh-syntax-highlightning npm)

source $ZSH/oh-my-zsh.sh

# User
export LANG=en_US.UTF-8
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"

# Android
export ANDROID_HOME=${HOME}/Library/Android/sdk
export PATH=${PATH}:${ANDROID_HOME}/tools
export PATH=${PATH}:${ANDROID_HOME}/platform-tools
export PATH=${PATH}:/Library/Frameworks/Mono.framework/Versions/Current/bin/

alias emulator="$ANDROID_HOME/tools/emulator"

# User Ruby Gems
export PATH=${PATH}:${HOME}/.gem/ruby/2.3.0/bin

# NVM
export NVM_DIR="$HOME/.nvm"
. "/usr/local/opt/nvm/nvm.sh"

# TMUX
alias tm="tmux -u attach || tmux -u new"

# Fastlane
export PATH="$HOME/.fastlane/bin:$PATH"

# ZFZ Fuzzy search
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
