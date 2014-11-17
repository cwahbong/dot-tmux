#!/usr/bin/env sh
set -u

TMUX_DEFAULT_PREFIX="${HOME}/.tmux"

CONFIG_INSTALL () {
	TMUX_PREFIX=${1:-$TMUX_DEFAULT_PREFIX}
	TMUX_CONF="$HOME/.tmux.conf"

	if [ -L "$TMUX_CONF" ]; then
		rm "$TMUX_CONF"
		echo "Found old symlink and removed it..."
	fi

	ln -s "${TMUX_PREFIX}/tmux.conf" "$TMUX_CONF" \
		&& echo "Conf installed succesfully."
}

CONFIG_HELP () {
	echo 'Usage: config.sh {install [prefix_path]|help}'
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
		exit 1
		;;
esac
