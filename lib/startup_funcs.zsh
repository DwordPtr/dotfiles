# setup functions that help
# make a zshrc and place_files
# file put them
# here so they can be used
# anywhere in the zshrc file
# I have anecdotal evidence
# that they work

alias sconf="nvim $HOME/lib/startup_funcs.zsh"

function make_clone_dir(){
        if [ ! -d "$HOME/$1" ]; then
                git clone ${2} ${HOME}/${1}
        fi
}
function make_home_dir(){
        if [ ! -d "$HOME/$1" ]; then
                mkdir -p $HOME/$1
        fi
}
function add_aliases(){
        if [ ! -f $HOME/aliases/$1 ]; then
                echo no $1 placed
        else
                source $HOME/aliases/$1
        fi
}
function asource(){
        source $ALIAS_DIR/$1
}

function place_alias(){
        ln -sf $PWD/aliases/$1 $ALIASES/$1
}

function place_all_aliases(){
        for file in $PWD/aliases/*;
        do place_alias `basename $file`;
        done
}

function place_config(){
        if [ ! -f "$(dirname "$2")" ]; then
                mkdir -p "$(dirname "$2")"
        fi
        ln -sf "$1" "$2"
}
function place_configs(){
        src_dir="$1"
        config_dir="$2"
        for file in "$src_dir"/*;
        do 
                place_config $file $config_dir/`basename $file`;
        done
}

function place_scripts(){
        find $PWD/scripts/ -maxdepth 1 -type f | xargs -I {} ln -sf {} $HOME/bin
        if [ "$DISTRO" = "Darwin" ]; then
                OS_SPECIFIC_SCRIPTS=${PWD}/scripts/macos
        else
                OS_SPECIFIC_SCRIPTS=${PWD}/scripts/linux
        fi
        for file in $(find "$OS_SPECIFIC_SCRIPTS" -type f); do
                place_config $file ${HOME}/bin/"$(basename "$file")"
        done

}

function src_all_aliases(){
        for file in $HOME/aliases/*;
        do
                if echo $file | grep -vq '.md'; then
                        add_aliases `basename $file`;
                fi
        done
}

