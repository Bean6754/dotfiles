# Setup command history file.
HISTSIZE=100
HISTFILE=.ksh_history
export HISTSIZE HISTFILE

#PATH=
#TERM=
#PS1=
EDITOR=/usr/bin/vim
BROWSER=/usr/bin/firefox
export EDITOR BROWSER

# Bindings.
bind -m '^L'=clear'^J'

# Tab-completion (Vim-like).
set -o vi
