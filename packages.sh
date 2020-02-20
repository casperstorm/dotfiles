#!/bin/sh
source helpers.sh

packages=(
  "fzf"
  "z"
  "yabai"
  "koekeishiya/formulae/skhd"
  "zsh"
  "zsh-completions"
  "zsh-syntax-highlighting"
  "zsh-autosuggestions"
  "git"
  "neovim"
  "yabai"
  "ripgrep"
  "asdf"
  "coreutils"
  "gpg"
  "tmux"
)

casks=(
  "kitty"
  "font-jetbrains-mono"
)

taps=(
  "homebrew/cask-fonts"
)

function additional_setup {
  options=("NeoVim" "ZSH and Promt")
  select opt in "${options[@]}"
  do
    case $opt in
      "${options[0]}")
        message "Setting up NeoVim."

        pip3 install neovim
        yarn global add neovim
        nvim +PlugInstall +qall
        break
        ;;
      "${options[1]}")
        message "Downloading <spaceship> promt for zsh"

        git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt"
        ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"

        message "Changing default shell to ZSH."

        sudo sh -c "echo $(which zsh) >> /etc/shells"
        chsh -s $(which zsh)
        break
        ;;
      *) echo "invalid option $REPLY";;
    esac
  done
}

function install_casks {
  message "Setting up Homebrew taps"
  for i in "${taps[@]}"
  do
    brew tap $i
  done

  message "Installing Homebrew Casks."
  for i in "${casks[@]}"
  do
    brew cask install $i
  done
}

function update_casks {
  message "Updating Homebrew Casks."
  for i in ${casks[@]}
  do
    brew cask upgrade $i
  done
}

function install_packages {
  message "Installing Homebrew packages."
  for i in "${packages[@]}"
  do
    brew install $i
  done

  message "Preparing to install oh-my-zsh."
  if [ ! -d "$HOME/.oh-my-zsh" ]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
  else
    message "Oh-my-zsh is already installed."
  fi
}

function update_packages {
  message "Updating Homebrew packages."
  for i in "${packages[@]}"
  do
    brew upgrade $i
  done

}

