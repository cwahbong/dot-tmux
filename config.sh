#!/usr/bin/env sh
set -efu

TMUX_DEFAULT_PREFIX=${HOME}"/.tmux"

CONFIG_INSTALL () {
	TMUX_PREFIX=${1:-$TMUX_DEFAULT_PREFIX}
	TMUX_CONF=$HOME/.tmux.conf
	ln -s ${TMUX_PREFIX}/tmux.conf $HOME/.tmux.conf
}

CONFIG_HELP () {
	echo 'Usage: config.sh {install [prefix_path]|help}'
	return $(($? || $#))
}

if [ $# -gt 0 ]; then
	OP=$1
	shift
fi
case ${OP:-} in
	"install")
		CONFIG_INSTALL $@
		;;
	"help")
		CONFIG_HELP $@
		;;
	*)
		CONFIG_HELP $@
		exit $(($? || 1))
		;;
esac
