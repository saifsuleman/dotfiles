export SHELL=/usr/bin/fish
alias vim="nvim"
alias ssh='env TERM=xterm-256color ssh'

eval (ssh-agent -c)
ssh-add

neofetch
