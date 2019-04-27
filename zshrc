unsetopt AUTO_CD
source  $HOME/lib/startup_funcs.zsh
make_clone_dir ".zgen", "https://github.com/tarjoilija/zgen"
source "${HOME}/.zgen/zgen.zsh"
# if the init script doesn't exist
if ! zgen saved; then

  # specify plugins here
  zgen oh-my-zsh
  zgen oh-my-zsh plugin/git
  zgen oh-my-zsh ssh-agent
  zgen oh-my-zsh gpg-agent

  zgen load twang817/zsh-fzf
  zgen load zsh-users/zsh-autosuggestions
  zgen load unixorn/autoupdate-zgen
  zgen load denysdovhan/spaceship-prompt spaceship

  # generate the init script from plugins above
  zgen save
fi

# User configuration
# export MANPATH="/usr/local/man:$MANPATH"
alias vg=vagrant

ALIAS_DIR="$HOME/aliases"
make_home_dir "aliases"
add_aliases "terjira_aliases.sh"
add_aliases "git_aliases.sh"
add_aliases "android.sh"
add_aliases "watson.sh"
add_aliases "docker.sh"

#network stuff
alias ports='netstat -tulpn'

#computer dirs
DOWNLOADS=$HOME/Downloads
alias dl='cd $DOWNLOADS'

#jboss server
#weather aliases
alias here='curl wttr.in/37067'
alias home='curl wttr.in/37055'

#cross platflorm clipboard aliases
function copy(){
	if [ `uname` = 'Darwin' ]; then
		pbcopy
	else
		xclip -sel clip
	fi
}
function paste(){
	if [`uname` = 'Darwin']; then
		pbpaste
	else
		xclip -o
	fi
}
alias p='paste'
alias y='copy'
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_131.jdk/Contents/Home

#todo add cross platform update function
# really just macos/ubuntu

#complete up work in progress
#alias cup='up && sudo pip2 install -U && sudo pip3 install -U && sudo snap refresh'
alias m='neomutt'
alias mutt='neomutt'
alias vim='nvim'
#for adding stuff to the bashrc
alias t='todo.sh'
alias conf='vim ~/.zshrc'
alias reconf='source ~/.zshrc'
alias vconf='vim ~/.config/nvim/init.vim'
alias iconf='vim ~/.ideavimrc'

# spaceship theme options
# todo breakout into other file
cyan_replacement=208
SPACESHIP_DIR_COLOR=$cyan_replacement
SPACESHIP_ELM_COLOR=$cyan_replacement
SPACESHIP_GOLANG_COLOR=$cyan_replacement
SPACESHIP_DOCKER_COLOR=$cyan_replacement
SPACESHIP_KUBECONTEXT_COLOR=$cyan_replacement
SPACESHIP_DIR_COLOR=$cyan_replacement
SPACESHIP_PROMPT_DEFAULT_PREFIX=$cyan_replacement
SPACESHIP_PROMPT_DEFAULT_SUFFIX=$cyan_replacement
white_replacement=16
SPACESHIP_VI_MODE_COLOR=$white_replacement
SPACESHIP_FOOBAR_COLOR=$white_replacement

SPACESHIP_CHAR_COLOR_SECONDARY=$white_replacement
SPACESHIP_TIME_COLOR=$white_replacement
SPACESHIP_USER_COLOR=$white_replacement
SPACESHIP_SWIFT_COLOR=$white_replacement
SPACESHIP_PYENV_COLOR=$white_replacement
SPACESHIP_EXEC_TIME_COLOR=$white_replacement

#dircolors
#eval "`dircolors -b $HOME/.dircolorsscr`"
#export LS_OPTIONS='--color=auto'



#colorize man pages experiment
man() {
    env \
        LESS_TERMCAP_mb=$(printf "\e[1;31m") \
        LESS_TERMCAP_md=$(printf "\e[1;31m") \
        LESS_TERMCAP_me=$(printf "\e[0m") \
        LESS_TERMCAP_se=$(printf "\e[0m") \
        LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
        LESS_TERMCAP_ue=$(printf "\e[0m") \
        LESS_TERMCAP_us=$(printf "\e[1;32m") \
            man "$@"
}
# iterm2 profile
 it2prof() { echo -e "\033]50;SetProfile=$1\a" }
# git extras completion
  source /usr/local/opt/git-extras/share/git-extras/git-extras-completion.zsh
# put bitbucket cli on path
export PATH=$PATH:$HOME/Library/Python/2.7/bin
# set neovim as default editor
export EDITOR='nvr'
alias notes='terminal_velocity'
#z stuff
. `brew --prefix`/etc/profile.d/z.sh
source "$HOME/.sdkman/bin/sdkman-init.sh"

#annoying warning about nesting sessions
alias tmux='TERM=xterm-256color tmux 2> /dev/null '
alias getBoard='echo 73913 | pbcopy'
alias ctags="`brew --prefix`/bin/ctags"
alias html='w3m -I %{charset} -T text/html'
# cd..
function cd_up() {
  cd $(printf "%0.s../" $(seq 1 $1 ));
}
function cddir() {
	cd $(dirname $1)
}
alias fname='basename'
# short for back
alias b='cd -'
alias 'cd..'='cd_up'
function v(){
	if [ -z $NVIM_LISTEN_ADDRESS ]; then
		nvim "$@"
	else
		nvr "$@"
	fi
}
# clear nvim swap
function clear_nvim_swap(){
	rm $HOME/.local/share/nvim/swap/*
}
alias cns=clear_nvim_swap
function remember(){
	$@ | tee -a ~/.memory/output-$(date "+%Y-%m-%d").log
}
# make a junk folder for
# files so they don't clutter git dirs
make_home_dir "junk"
export JUNK=$HOME/junk
make_home_dir ".logs"
make_home_dir ".memory"

# elixir aliases
alias mf='mix format'
#zsh bind keys
bindkey '^ ' forward-word
date
cat ~/.notes
alias today='nvim ~/.logs/shell-history-$(date "+%Y-%m-%d").log'
PROMPT_COMMAND='if [ "$(id -u)" -ne 0 ]; then echo "$(date "+%Y-%m-%d.%H:%M:%S") $(pwd) $(fc -l -1)" >> ~/.logs/shell-history-$(date "+%Y-%m-%d").log; fi'
if [ -f $HOME/.lzshrc ]; then
   source $HOME/.lzshrc
else 
   echo "no local zshrc"
fi
preexec(){ eval $PROMPT_COMMAND }
#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
