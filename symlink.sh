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
mkdir -p ~/.config/tmux/plugins
mkdir -p ~/.config/kitty
mkdir -p ~/.config/nvim

# Symlinking
symlink ./files/kitty/kitty.conf ~/.config/kitty/kitty.conf
symlink ./files/kitty/nord.conf ~/.config/kitty/nord.conf
symlink ./files/asdf/asdfrc ~/.config/asdf/asdfrc
symlink ./files/yabai/yabairc ~/.config/yabai/yabairc
symlink ./files/skhd/skhdrc ~/.config/skhd/skhdrc
symlink ./files/tmux/tmux.conf ~/.config/tmux/.tmux.conf
symlink ./files/zsh/zshrc ~/.zshrc
symlink ./files/nvim/init.vim ~/.config/nvim/init.vim
symlink ./files/nvim/plugins.vim ~/.config/nvim/plugins.vim
symlink ./files/nvim/coc-settings.json ~/.config/nvim/coc-settings.json
