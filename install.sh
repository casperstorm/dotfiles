#!/bin/bash

# Making sure we have Xcode CLI installed
xcode-select --install

# Making sure we have Homebrew
which -s brew
if [[ $? != 0 ]] ; then
    echo "Installing homebrew..."
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

source ./casks.sh
source ./formulae.sh