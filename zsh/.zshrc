export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

# z
. $(brew --prefix)/etc/profile.d/z.sh

# asdf
. /opt/homebrew/opt/asdf/libexec/asdf.sh

# alias
alias t="tmux attach || tmux new-session"
alias l='ls -lAFh'
alias ll='l'
alias vim='nvim'

plugins=(git zsh-autosuggestions zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"
