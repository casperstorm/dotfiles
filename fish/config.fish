# paths
fish_add_path $HOME/.cargo/bin
fish_add_path /opt/homebrew/bin

# plugins
zoxide init fish | source

# alias
alias t="tmux attach || tmux new-session"
alias vim='nvim'
alias v='vim'
alias l='ls -ahlF'
alias .. 'cd ..'
