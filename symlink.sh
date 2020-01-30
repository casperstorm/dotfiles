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
mkdir -p ~/.config/asdf
mkdir -p ~/.config/yabai
mkdir -p ~/.config/skhd
mkdir -p ~/.config/tmux
mkdir -p ~/.config/tmux/themes
mkdir -p ~/.config/alacritty	

# Symlinking
symlink ./files/alacritty.yml ~/.config/alacritty/alacritty.yml
symlink ./files/asdfrc ~/.config/asdf/asdfrc
symlink ./files/yabairc ~/.config/yabai/yabairc
symlink ./files/skhdrc ~/.config/skhd/skhdrc
symlink ./files/tmux.conf ~/.config/tmux/.tmux.conf
symlink ./files/zshrc ~/.zshrc