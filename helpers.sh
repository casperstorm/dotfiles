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

function dependency {
    which -s $1
    if [[ $? != 0 ]] ; then
        echo "Installing $1..."
        brew install $1
    else
        echo "Updating $1..."
        brew upgrade $1
    fi
}

function cask_dependency {
    echo "Installing $1..."
    brew cask install $1
}