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

# Making sure we have config folder
mkdir -p ~/.config

# # Making sure we have brew
# which -s brew
# if [[ $? != 0 ]] ; then
#   echo "Installing homebrew..."
#   ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
# else
#   echo "Updating homebrew..."
#   brew update
# fi

# # Utils
# echo "Installing utils..."
# brew install coreutils

# # Fonts
# echo "Installing fonts..."
# brew cask install font-fira-code

# ZSH
symlink ./files/zshrc ~/.zshrc

# Alacritty
# echo "Installing alacritty…"
# brew cask install alacritty
# mkdir -p ~/.config/alacritty
symlink ./files/alacritty.yml ~/.config/alacritty/alacritty.yml  