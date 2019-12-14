#! /bin/bash
export ALIASES=$HOME/aliases
export DISTRO=`uname`
SCRIPT_PATH="${0:A:h}"
echo $SCRIPT_PATH
source './lib/startup_funcs.zsh'

if [ "$DISTRO" = "Darwin" ]; then
        VSCODE_DIR="${HOME}/Library/Application\ Support/Code/User"
else
        VSCODE_DIR="${HOME}/.config/Code/User"
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

if [ "$DISTRO" = "Darwin" ]; then
        cp chunkwm/skhdrc ~/.skhdrc
        cp chunkwm/chunkwmrc ~/.chunkwmrc
fi

mkdir -p $HOME/.config/nvim
ln -sf $PWD/nvimrc $HOME/.config/nvim/init.vim

if [ "$DISTRO" != "Darwin" ]; then
        place_config $PWD/i3/config $HOME/.config/i3/config
        place_config $PWD/i3/lock.sh $HOME/bin/lock.sh
        place_config $PWD/rofi $HOME/.config/rofi/config.rasi
fi
place_scripts
place_all_aliases
