import os

def user_state():
    grains = {}
    # Some code for logic that sets grains like
    grains['homedir'] = os.path.expandvars('/Users/$USER')
    grains['configdir'] = os.path.expandvars('/Users/$USER/.config')
    grains['statesdir'] = os.path.expandvars('/Users/$USER/source/private/dotfiles/states')
    return grains
