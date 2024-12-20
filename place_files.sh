#! /bin/bash
#    _____ __  __ ____     ____ ___   ___
#   / ___// / / // __ \   / __ `__ \ / _ \
#  / /   / /_/ // / / /  / / / / / //  __/
# /_/    \__,_//_/ /_/  /_/ /_/ /_/ \___/

# vim:fdm=marker
# export variables /source library {{{
export ALIASES=$HOME/aliases
export DISTRO=`uname`
export WM='yabai'
source './lib/startup_funcs.zsh'
# }}}
# find vscode config dir {{{
if [ "$DISTRO" = "Darwin" ]; then
        VSCODE_DIR="${HOME}/Library/Application\ Support/Code/User"
else
        VSCODE_DIR="${HOME}/.config/Code/User"
fi
# }}}
# make dependent directories {{{
make_home_dir 'bin'
make_home_dir 'lib'
# }}}
# place general dot files {{{
place_config $PWD/lib/startup_funcs.zsh $HOME/lib/startup_funcs.zsh
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
place_config $PWD/init.lua $HOME/.config/nvim/init.lua
place_configs $PWD/ranger $HOME/.config/ranger
# no harm if a linux system gets a useless config
place_config $PWD/yabai/skhdrc $HOME/skhd/skhdrc
place_config $PWD/yabai/yabairc $HOME/yabai/yabairc
# }}}
# linux specific configs {{{
if [ "$DISTRO" != "Darwin" ]; then
        place_config $PWD/i3/config $HOME/.config/i3/config
        place_config $PWD/i3/lock.sh $HOME/bin/lock.sh
        place_config $PWD/rofi $HOME/.config/rofi/config.rasi
        place_config $PWD/assets/ibm.jpg $HOME/Pictures/ibm.jpg
        place_configs $PWD/polybar $HOmE/.config/polybar/config
fi
# }}}
# place scripts/aliases {{{
place_scripts
place_all_aliases
# }}}
