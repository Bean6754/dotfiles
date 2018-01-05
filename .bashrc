#    _               _              
#   | |             | |             
#   | |__   __ _ ___| |__  _ __ ___ 
#   | '_ \ / _` / __| '_ \| '__/ __|
#  _| |_) | (_| \__ \ | | | | | (__ 
# (_)_.__/ \__,_|___/_| |_|_|  \___|

# REMINDER: Use ' for strings and " for programming.

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Exports.
# root: PS1="\033[01;33m\]\h\033[00m\]:\033[01;34m\]\w\033[01;31m\]\$\033[00m\] "
export PS1="\033[01;33m\]\h\033[00m\]:\033[01;34m\]\w\033[01;32m\]\$\033[00m\] "
export CFLAGS="-O2 -march=native"
export MAKEOPTS="-j4"
export CXXFLAGS=$CFLAGS

# Functions.
filesize () {
	name=$1
	
	if [[ -n "$name" ]]; then
		ls -aGhl $name | awk -F " " {"print $5"}
	else
		echo "Argument error!"
	fi
}

# Aliases.
alias emacs='emacs -nw'
