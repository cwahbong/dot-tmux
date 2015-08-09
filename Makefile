update:
	git pull --rebase

install:
	ln --backup=numbered -n -s -r tmux.conf $(HOME)/.tmux.conf

Makefile: ; # Do not remake makefile.

.PHONY: all update install clean
