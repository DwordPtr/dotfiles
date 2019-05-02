#! /bin/bash
DISTRO=`uname`
ALIASES=$HOME/aliases
source './lib/startup_funcs.zsh' 
make_home_dir 'bin'
make_home_dir 'lib'
ln -fs $PWD/lib/startup_funcs.zsh $HOME/lib/startup_funcs.zsh

#don't ever run me outisde of my dir
ln -fs $PWD/ideavimrc $HOME/.ideavimrc
ln -fs $PWD/vimrc $HOME/.vimrc
ln -fs $PWD/tvrc $HOME/.tvrc
ln -fs $PWD/dircolorsscr $HOME/.dircolorsscr
ln -fs $PWD/tmux.conf.local $HOME/.tmux.conf.local

if [ "$DISTRO" = "Darwin" ]; then
	cp chunkwm/skhdrc ~/.skhdrc
	cp chunkwm/chunkwmrc ~/.chunkwmrc
fi

mkdir -p $HOME/.config/nvim
ln -sf $PWD/nvimrc $HOME/.config/nvim/init.vim

if [ "$DISTRO" != "Darwin" ]; then
	mkdir -p $HOME/config/i3
	ln -sf $PWD/i3/config $HOME/.config/i3/config
        ln -fs $PWD/i3/lock.sh $HOME/bin/lock.sh
fi

#todo add all alias files in for-loop
place_alias git_aliases.sh
place_alias terjira_aliases.sh
place_alias android.sh
place_alias watson.sh
place_alias docker.sh
place_alias vim.sh

