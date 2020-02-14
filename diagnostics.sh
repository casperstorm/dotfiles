#!/bin/sh
source helpers.sh

function run_diagnostics {
  brew="/usr/local/bin/brew"
  if [ -f "$brew" ]
  then
    message "Homebrew is installed."
  else
    message "Installing Homebrew."
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  fi
}
