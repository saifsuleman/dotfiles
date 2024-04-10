export SHELL=/usr/bin/fish
alias vim="nvim"
alias ssh='env TERM=xterm-256color ssh'

alias python="~/venv/bin/python3"
alias pip="~/venv/bin/pip"

eval (ssh-agent -c)
ssh-add

neofetch
