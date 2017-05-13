# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Exports.
export CFLAGS="-O2 -march=native"
export MAKEOPTS="-j4"
export CXXFLAGS=$CFLAGS
