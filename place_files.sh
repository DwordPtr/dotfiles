#! /bin/bash
if [ ! -d $HOME/bin ]; then
	mkdir $HOME/bin
fi
#don't ever run me outisde of my dir
ln -fs $PWD/ideavimrc $HOME/.ideavimrc
ln -fs $PWD/vimrc $HOME/.vimrc
ln -fs $PWD/tvrc $HOME/.tvrc
ln -fs $PWD/dircolorsscr $HOME/.dircolorsscr
ln -fs $PWD/tmux.conf.local $HOME/.tmux.conf.local
ln -fs $PWD/.tmux $HOME/.tmux
ln -fs $PWD/.tmux/.tmux.conf $HOME/.tmux.conf
# chunkwm doesn't seem to like symlinks
cp $PWD/chunkwm/chunkwmrc $HOME/.chunkwmrc 
cp $PWD/chunkwm/skhdrc $HOME/.skhdrc 
ln -fs $PWD/chunkwm/open_iterm2.sh $HOME/bin/open_iterm2.sh
mkdir -p $HOME/.config/nvim
ln -sf $PWD/nvimrc $HOME/.config/nvim/init.vim

## bash or zsh for now I don't use anything else

if [ -d $HOME/.oh-my-zsh ]; then
	THEMES=$HOME/.oh-my-zsh/themes
	echo $THEMES
	ln -fs $PWD/thinkpad.zsh-theme $THEMES
	ln -fs $PWD/work.zsh-theme $THEMES
fi
# put in the rc files regardless
ln -fs $PWD/zshrc $HOME/.zshrc
ln -fs $PWD/bashrc $HOME/.bashrc #note kinda unmaintained
mkdir -p $HOME/aliases
ln -fs $PWD/aliases/git_aliases.sh $HOME/aliases/git_aliases.sh


mkdir -p $HOME/bin

ln -fs $PWD/bin/v $HOME/bin/v
