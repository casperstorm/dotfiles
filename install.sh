#!/bin/bash

which -s brew
if [[ $? != 0 ]] ; then
    echo "Installing homebrew..."
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew tap koekeishiya/formulae

brew install fzf
brew install z
brew install yarn
brew install yabai
brew install koekeishiya/formulae/skhd
brew install zsh
brew install zsh-completions 
brew install zsh-syntax-highlighting 
brew install zsh-autosuggestions

brew cask install alacritty	

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"