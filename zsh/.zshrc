export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

# asdf
. $(brew --prefix)/opt/asdf/libexec/asdf.sh

# zoxide
eval "$(zoxide init zsh)"

# alias
alias t="tmux attach || tmux new-session"
alias l='ls -lAFh'
alias ll='l'
alias ls='l'
alias vim='nvim'

# zsh-autosuggestions & zsh-syntax-highlighting
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

plugins=(git)
source $ZSH/oh-my-zsh.sh

