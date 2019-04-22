#! /bin/bash
DISTRO=`uname`
ALIASES=$HOME/aliases
function place_alias(){
	ln -fs $PWD/aliases/$1 $ALIASES/$1
}
if [ ! -d $HOME/bin ]; then
	mkdir $HOME/bin
fi
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

## bash or zsh for now I don't use anything else

if [ -d $HOME/.oh-my-zsh ]; then
	THEMES=$HOME/.oh-my-zsh/themes
	echo $THEMES
	ln -fs $PWD/thinkpad.zsh-theme $THEMES
fi
#todo add all alias files in for-loop
place_alias git_aliases.sh
place_alias terjira_aliases.sh
place_alias android.sh
place_alias watson.sh
#todo add scripts

mkdir -p $HOME/bin

