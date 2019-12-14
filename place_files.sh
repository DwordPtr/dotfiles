#! /bin/bash
ALIASES=$HOME/aliases
source './lib/startup_funcs.zsh'
DISTRO=`uname`
echo $0
if [ isMac = true ]; then
        VSCODE_DIR=$HOME/Library/Application\ Support/Code/User
else
        VSCODE_DIR=$HOME/.config/Code/User
fi
make_home_dir 'bin'
make_home_dir 'lib'
place_config $PWD/lib/startup_funcs.zsh $HOME/lib/startup_funcs.zsh

#don't ever run me outisde of my dir
place_config $PWD/ideavimrc $HOME/.ideavimrc
place_config $PWD/vimrc $HOME/.vimrc
place_config $PWD/tvrc $HOME/.tvrc
place_config $PWD/dircolorsscr $HOME/.dircolorsscr
place_config $PWD/tmux.conf.local $HOME/.tmux.conf.local
place_config $PWD/zshrc $HOME/.zshrc
place_config $PWD/mailcap $HOME/.mailcap
place_config $PWD/muttkeys $HOME/.muttkeys
place_config $PWD/signature $HOME/.signature
place_config $PWD/todo_config $HOME/.todo/config
place_config $PWD/kitty.conf $HOME/.config/kitty/kitty.conf
place_config $PWD/vscode/settings.json "${VSCODE_DIR}/settings.json"
place_config $PWD/vscode/keybindings.json "${VSCODE_DIR}/keybindings.json"

if [ isMac = true ]; then
        cp chunkwm/skhdrc ~/.skhdrc
        cp chunkwm/chunkwmrc ~/.chunkwmrc
fi

mkdir -p $HOME/.config/nvim
ln -sf $PWD/nvimrc $HOME/.config/nvim/init.vim

if [ isMac = false ]; then
        place_config $PWD/i3/config $HOME/.config/i3/config
        place_config $PWD/i3/lock.sh $HOME/bin/lock.sh
fi

cp scripts/* ~/bin/
place_all_aliases
