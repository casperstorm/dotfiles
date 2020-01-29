#!/bin/bash
source ./helpers.sh

# Making sure we have config folder
mkdir -p ~/.config

dependency fzf
dependency z
dependency asdf
dependency yarn

brew tap koekeishiya/formulae
dependency yabai
mkdir -p ~/.config/yabai
symlink ./files/yabairc ~/.config/yabai/yabairc

dependency koekeishiya/formulae/skhd
mkdir -p ~/.config/skhd
symlink ./files/skhdrc ~/.skhdrc
# Note: This should be moved to ~/.config/skhd/skhdrc at somepoint, but failing for now.

dependency tmux
mkdir -p ~/.config/tmux
symlink ./files/tmux.conf ~/.config/.tmux.conf
git clone git@github.com:goronfreeman/nord-tmux.git ~/.config/tmux/themes/nord-tmux
# Note: using a fork, because as of writing this (2020-01-16) org repo does not support +2.9 tmux.

dependency zsh
dependency zsh-completions 
dependency zsh-syntax-highlighting 
dependency zsh-autosuggestions
chsh -s $(which zsh)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
symlink ./files/zshrc ~/.zshrc