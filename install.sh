#!/bin/bash

function symlink {
    CURRENT_REALPATH=$(realpath -m "$2")
    TARGET_REALPATH=$(realpath -m "$1")
    if [[ "$CURRENT_REALPATH" != "$TARGET_REALPATH" ]]; then
        if [[ ! -f "$2" ]] || [[ ! -d "$2" ]]; then
            rm -rf "$2"
        fi
        ln -sf $TARGET_REALPATH $CURRENT_REALPATH
    fi
}

function dependency {
    which -s $1
    if [[ $? != 0 ]] ; then
        echo "Installing $1..."
        brew install $1
    else
        echo "Updating $1..."
        brew upgrade $1
    fi
}

function cask_dependency {
    if ! brew cask info $1 &>/dev/null; then
        echo "Installing $1..."
        brew cask install $1
    else
        echo "Updating $1..."
        brew cask upgrade $1
    fi
}

# Making sure we have Xcode CLI installed
xcode-select --install

# Making sure we have config folder
mkdir -p ~/.config

which -s brew
if [[ $? != 0 ]] ; then
    echo "Installing homebrew..."
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

dependency fzf
dependency z
dependency asdf

dependency yabai
mkdir -p ~/.config/yabai
symlink ./files/yabairc ~/.config/yabai/.yabairc

dependency tmux
mkdir -p ~/.config/tmux
symlink ./files/tmux.conf ~/.config/.tmux.conf
git clone git@github.com:goronfreeman/nord-tmux.git ~/.config/tmux/themes/nord-tmux
# Note: using a fork, because as of writing this (2020-01-16) org repo does not support +2.9 tmux.


cask_dependency alacritty
mkdir -p ~/.config/alacritty
symlink ./files/alacritty.yml ~/.config/alacritty/alacritty.yml

cask_dependency visual-studio-code
# todo: config / symlink

dependency zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
symlink ./files/zshrc ~/.zshrc
