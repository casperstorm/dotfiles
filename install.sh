#!/bin/sh
echo "---------------------------------------------------------"
echo "$(tput setaf 2)ASYNC: Preparing to power up and begin diagnostics.$(tput sgr 0)"
echo "---------------------------------------------------------"
echo "---------------------------------------------------------"
echo "$(tput setaf 2)ASYNC: Checking for Homebrew installation.$(tput sgr 0)"
echo "---------------------------------------------------------"
brew="/usr/local/bin/brew"
if [ -f "$brew" ]
then
  echo "---------------------------------------------------------"
  echo "$(tput setaf 2)ASYNC: Homebrew is installed.$(tput sgr 0)"
  echo "---------------------------------------------------------"
else
  echo "---------------------------------------------------------"
  echo "$(tput setaf 3)ASYNC: Installing Homebrew. Homebrew requires osx command lines tools, please download xcode first$(tput sgr 0)"
  echo "---------------------------------------------------------"
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi
echo "---------------------------------------------------------"
echo "$(tput setaf 2)ASYNC: Installing system packages.$(tput sgr 0)"
echo "---------------------------------------------------------"

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

for i in "${packages[@]}"
do
  brew install $i
  echo "---------------------------------------------------------"
done
echo "---------------------------------------------------------"
echo "$(tput setaf 2)ASYNC: Installing asdf plugins.$(tput sgr 0)"
echo "---------------------------------------------------------"

asdf plugin-add yarn
asdf plugin-add java
asdf plugin-add nodejs
asdf plugin-add ruby
asdf plugin-add python

echo "---------------------------------------------------------"
echo "$(tput setaf 2)ASYNC: Installing latest asdf plugin versions.$(tput sgr 0)"
echo "---------------------------------------------------------"

asdf install yarn $(asdf latest yarn)
asdf install nodejs $(asdf latest nodejs)
asdf install ruby $(asdf latest ruby)
asdf install python $(asdf latest python)

echo "---------------------------------------------------------"
echo "$(tput setaf 2)ASYNC: Setting global versions to ~/.tool-versions.$(tput sgr 0)"
echo "---------------------------------------------------------"

asdf global yarn $(asdf latest yarn)
asdf global nodejs $(asdf latest nodejs)
asdf global ruby $(asdf latest ruby)
asdf global python $(asdf latest python)

asdf current

echo "---------------------------------------------------------"
echo "$(tput setaf 2)ASYNC: Installing python neovim client.$(tput sgr 0)"
echo "---------------------------------------------------------"

pip3 install neovim

echo "---------------------------------------------------------"
echo "$(tput setaf 2)ASYNC: Installing node neovim package$(tput sgr 0)"
echo "---------------------------------------------------------"

yarn global add neovim

echo "---------------------------------------------------------"
echo "$(tput setaf 2)ASYNC: Installing system applications$(tput sgr 0)"
echo "---------------------------------------------------------"

brew cask install kitty

echo "---------------------------------------------------------"
echo "$(tput setaf 2)ASYNC: Installing system fonts.$(tput sgr 0)"
echo "---------------------------------------------------------"

brew tap homebrew/cask-fonts
brew cask install font-cascadia

echo "---------------------------------------------------------"
echo "$(tput setaf 2)ASYNC: Installing oh-my-zsh.$(tput sgr 0)"
echo "---------------------------------------------------------"

if [ ! -d "$HOME/.oh-my-zsh" ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
else
  echo "---------------------------------------------------------"
  echo "$(tput setaf 2)ASYNC: oh-my-zsh already installed.$(tput sgr 0)"
  echo "---------------------------------------------------------"
fi

echo "---------------------------------------------------------"
echo "$(tput setaf 2)ASYNC: Linking dotfiles.$(tput sgr 0)"
echo "---------------------------------------------------------"

source symlink.sh

echo "---------------------------------------------------------"
echo "$(tput setaf 2)ASYNC: Installing neovim plugins and linking dotfiles.$(tput sgr 0)"
echo "---------------------------------------------------------"

nvim +PlugInstall +qall
nvim +UpdateRemotePlugins +qall

echo "---------------------------------------------------------"
echo "$(tput setaf 2)ASYNC: Switching shell to zsh. You may need to logout.$(tput sgr 0)"
echo "---------------------------------------------------------"

sudo sh -c "echo $(which zsh) >> /etc/shells"
chsh -s $(which zsh)

echo "---------------------------------------------------------"
echo "$(tput setaf 2)ASYNC: System update complete. Currently running at 100% power. Enjoy.$(tput sgr 0)"
echo "---------------------------------------------------------"

exit 0
