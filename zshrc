#   ╺━┓┏━┓╻ ╻┏━┓┏━╸
#   ┏━┛┗━┓┣━┫┣┳┛┃  
#   ┗━╸┗━┛╹ ╹╹┗╸┗━╸
# vim:fdm=marker
# setopts {{{
unsetopt AUTO_CD
setopt inc_append_history
setopt share_history
# }}}
# load library functions {{{
source  $HOME/lib/startup_funcs.zsh
# }}}
# zgen plugins {{{
# if the init script doesn't exist
make_clone_dir ".zgen" "https://github.com/tarjoilija/zgen"
source "${HOME}/.zgen/zgen.zsh"
if ! zgen saved; then

  # specify plugins here
  zgen oh-my-zsh
  zgen oh-my-zsh plugin/git
  zgen oh-my-zsh gpg-agent
  if [ "$DISTRO" = "Darwin" ]; then
          zgen oh-my-zsh brew
  fi

  zgen load twang817/zsh-fzf
  zgen load twang817/zsh-ssh-agent
  zgen load agkozak/zsh-z
  zgen load zsh-users/zsh-autosuggestions
  zgen load unixorn/autoupdate-zgen
  zgen load denysdovhan/spaceship-prompt spaceship

  # generate the init script from plugins above
  zgen save
fi
# }}}
# bindkeys {{{
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line
bindkey '^ ' forward-word
#}}}
# vagrant aliases {{{
alias vg=vagrant
alias vs='vagrant ssh'
alias vh='vagrant halt'
alias vu='vagrant up'
# }}}
# alias sourcing {{{
ALIAS_DIR="$HOME/aliases"
make_home_dir "aliases"
src_all_aliases
#}}}
# random aliases {{{
alias ports='netstat -tulpn'
alias r='fc -e -'
alias here='curl wttr.in/37067'
alias home='curl wttr.in/37055'
alias t='todo.sh'
alias fname='basename'
alias notes='terminal_velocity'
alias tmux='TERM=xterm-256color tmux 2> /dev/null '
alias html='w3m -I %{charset} -T text/html'
alias rmcodes='sed -r "s/[[:cntrl:]]\[[0-9]{1,3}m//g"'
# }}}
#cross platflorm clipboard aliases {{{
function copy(){
        if [ `uname` = 'Darwin' ]; then
                pbcopy
        else
                xclip -sel clip
        fi
}
function paste(){
        if [ `uname` = 'Darwin' ]; then
                pbpaste
        else
                xclip -o
        fi
}
function o(){
        if [ `uname` = 'Darwin' ]; then
                open "$@"
        else
                xdg-open "$@" &;
                disown
        fi
}
alias p='paste'
alias y='copy'
# }}}
# program aliases and config edit aliases {{{
alias m='neomutt'
alias mutt='neomutt'
alias vim='nvim'
#for adding stuff to the bashrc
alias conf='vim ~/.zshrc'
alias lconf='nvim ~/.lzshrc'
alias reconf='source ~/.zshrc'
alias vconf='vim ~/.config/nvim/init.vim'
alias iconf='vim ~/.ideavimrc'
alias mconf='vim ~/.muttrc'
# }}}
# spaceship config {{{
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
# }}}
# cd aliases {{{
function cd_up() {
        cd $(printf "%0.s../" $(seq 1 $1 ));
}
function cddir() {
        cd $(dirname $1)
}
# short for back
alias b='cd -'
alias 'cd..'='cd_up'
alias d='cd $HOME/dev'
alias h='cd $HOME'
alias bin='cd $HOME/bin'
DOWNLOADS=$HOME/Downloads
alias dl='cd $DOWNLOADS'
# }}}
# vim/neovim stuff {{{
export EDITOR='nvr'
function v(){
        if [ -z $NVIM_LISTEN_ADDRESS ]; then
                nvim "$@"
        else
                nvr "$@"
        fi
}
# }}}
# clear nvim swap {{{
function clear_nvim_swap(){
        rm $HOME/.local/share/nvim/swap/*
}
alias cns=clear_nvim_swap
# }}}
# junk {{{
make_home_dir "junk"
export JUNK=$HOME/junk
# }}}
# elixir aliases {{{
alias mf='mix format'
# }}}
# log every command {{{
make_home_dir ".logs"
make_home_dir ".memory"
function remember(){
        $@ | tee -a ~/.memory/output-$(date "+%Y-%m-%d").log
}
alias logs='cd ~/.logs/'
alias today='nvim ~/.logs/shell-history-$(date "+%Y-%m-%d").log'
PROMPT_COMMAND='if [ "$(id -u)" -ne 0 ]; then echo "$(date "+%Y-%m-%d.%H:%M:%S") $(pwd) $(fc -l -1)" >> ~/.logs/shell-history-$(date "+%Y-%m-%d").log; fi'
if [ -f $HOME/.lzshrc ]; then
        source $HOME/.lzshrc
else
        echo "no local zshrc"
fi
preexec(){ eval $PROMPT_COMMAND }
# }}}
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
