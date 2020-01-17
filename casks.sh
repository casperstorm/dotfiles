#!/bin/bash
source ./helpers.sh

cask_dependency alacritty	
mkdir -p ~/.config/alacritty	
symlink ./files/alacritty.yml ~/.config/alacritty/alacritty.yml

cask_dependency visual-studio-code
cask_dependency alfred
cask_dependency qlstephen
cask_dependency brave-browser
cask_dependency protonvpn
cask_dependency font-fira-code
