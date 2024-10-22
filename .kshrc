# Setup command history file.
HISTSIZE=100
HISTFILE=.ksh_history
export HISTSIZE HISTFILE

#PATH=
#TERM=
#root PS1='\[\e[94m\]\h\[\e[91m\]#\[\e[0m\] \[\e[38;5;202m\]'
PS1='\[\e[94m\]\h\[\e[92m\]\\$\[\e[0m\] \[\e[38;5;202m\]'
EDITOR=/usr/bin/vim
BROWSER=/usr/bin/firefox
export PS1 EDITOR BROWSER

# Bindings.
bind -m '^L'=clear'^J'

# Tab-completion (Vim-like).
set -o vi
