# $OpenBSD: dot.profile,v 1.8 2022/08/10 07:40:37 tb Exp $
#
# sh/ksh initialization

PATH=$HOME/bin:/bin:/sbin:/usr/bin:/usr/sbin:/usr/X11R6/bin:/usr/local/bin:/usr/local/sbin
export PATH HOME TERM

#HISTSIZE=1000
#HISTFILE=.ksh_history
#export HISTSIZE HISTFILE

export PS1=$(print '\033[33m\h\033[32m\$\033[00m ')
#root - export PS1=$(print '\033[33m\h\033[31m\$\033[00m ')
export EDITOR="vim"
## Aliases break without this line.
alias doas='doas '
alias ls='colorls -G'
## Fix arrow-keys.
set -o emacs
