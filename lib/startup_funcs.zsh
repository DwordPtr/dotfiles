# setup functions that help
# make a zshrc and place_files
# file put them
# here so they can be used 
# anywhere in the zshrc file
# I have anecdotal evidence 
# that they work
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
	ln -fs $PWD/aliases/$1 $ALIASES/$1
}