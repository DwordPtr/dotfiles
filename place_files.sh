#! /bin/bash
#don't ever run me outisde of my dir
ln -fs $PWD/ideavimrc $HOME/.ideavimrc
ln -fs $PWD/vimrc $HOME/.vimrc
ln -fs $PWD/tmux.conf.local $HOME/.tmux.conf.local
ln -fs $PWD/.tmux $HOME/.tmux
ln -fs $PWD/.tmux/.tmux.conf $HOME/.tmux.conf

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
ln -fs $PWD/aliases/git_aliases.sh $HOME/aliases/git_aliases.sh
