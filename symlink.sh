#!/bin/bash
source helpers.sh

function sl {
  CURRENT_REALPATH=$(realpath -m "$2")
  TARGET_REALPATH=$(realpath -m "$1")
  if [[ "$CURRENT_REALPATH" != "$TARGET_REALPATH" ]]; then
    if [[ ! -f "$2" ]] || [[ ! -d "$2" ]]; then
      rm -rf "$2"
    fi
    ln -sf $TARGET_REALPATH $CURRENT_REALPATH
  fi
}

function symlink {
  message "Creating symlink with dotfiles."

  mkdir -p ~/.config
  mkdir -p ~/.config/asdf
  mkdir -p ~/.config/yabai
  mkdir -p ~/.config/skhd
  mkdir -p ~/.config/tmux/plugins
  mkdir -p ~/.config/kitty
  mkdir -p ~/.config/nvim
  mkdir -p ~/.config/nvim/snippets

  sl ./files/kitty/kitty.conf ~/.config/kitty/kitty.conf
  sl ./files/kitty/nord.conf ~/.config/kitty/nord.conf
  sl ./files/asdf/asdfrc ~/.config/asdf/asdfrc
  sl ./files/yabai/yabairc ~/.config/yabai/yabairc
  sl ./files/skhd/skhdrc ~/.config/skhd/skhdrc
  sl ./files/tmux/tmux.conf ~/.config/tmux/.tmux.conf
  sl ./files/zsh/zshrc ~/.zshrc
  sl ./files/nvim/init.vim ~/.config/nvim/init.vim
  sl ./files/nvim/plugins.vim ~/.config/nvim/plugins.vim
  sl ./files/nvim/coc-settings.json ~/.config/nvim/coc-settings.json
  sl ./files/nvim/snippets/javascript.snip ~/.config/nvim/snippets/javascript.snip

  message "Symlinking complete."
}
