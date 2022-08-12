# plugins
zoxide init fish | source

# paths
fish_add_path $HOME/.cargo/bin

# alias
alias t="tmux attach || tmux new-session"
alias vim='nvim'
alias v='vim'
alias l='ls -ahlF'
alias .. 'cd ..'
