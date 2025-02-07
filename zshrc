#   ╺━┓┏━┓╻ ╻┏━┓┏━╸
#   ┏━┛┗━┓┣━┫┣┳┛┃
#   ┗━╸┗━┛╹ ╹╹┗╸┗━╸
# vim:fdm=marker
# setopts {{{
unsetopt AUTO_CD
setopt inc_append_history
setopt share_history
# make sure word separations are
# deliated between pipes
export WORDCHARS=${WORDCHARS}\|
if [[ -a $HOME/dev/kitty/kitty/launcher/./kitty ]]; then
        export TERMINAL=$HOME/dev/kitty/kitty/launcher/./kitty
fi
# }}}
# load library functions {{{
source  $HOME/lib/startup_funcs.zsh
make_home_dir "bin"
export PATH=$HOME/bin:$PATH
# }}}
# zgen plugins {{{
# if the init script doesn't exist
make_clone_dir ".zgen" "https://github.com/tarjoilija/zgen"
source "${HOME}/.zgen/zgen.zsh"
if ! zgen saved; then

  # specify plugins here
  #zgen oh-my-zsh
  #zgen oh-my-zsh plugin/git
  zgen oh-my-zsh gpg-agent
  zgen load twang817/zsh-fzf
  zgen load twang817/zsh-ssh-agent
  zgen load zsh-users/zsh-autosuggestions
  zgen load zsh-users/zsh-syntax-highlighting
  zgen load unixorn/autoupdate-zgen
  zgen load denysdovhan/spaceship-prompt spaceship
  zgen load atuinsh/atuin
  zgen load jeffreytse/zsh-vi-mode
  zgen load loiccoyle/zsh-github-copilot

  # generate the init script from plugins above
  zgen save
fi
# }}}
# bindkeys {{{
autoload edit-command-line; zle -N edit-command-line
# vi mode config {{{
function zvm_config() {
  ZVM_LINE_INIT_MODE=$ZVM_MODE_INSERT
  ZVM_VI_ESCAPE_BINDKEY='jj' 
  ZVM_VI_INSERT_ESCAPE_BINDKEY='jj' 
  ZVM_VI_SURROUND_BINDKEY="classic"
  ZVM_ESCAPE_KEYTIMEOUT=50000
  # for now NEX (the default key engine) fails after
  # every escape press when it's remapped
  ZVM_READKEY_ENGINE=$ZVM_READKEY_ENGINE_ZLE 
}

if [ -z $VIMRUNTIME ]; then
        export KEYTIMEOUT=30
        bindkey -v
        zvm_config
else
        bindkey -e
fi
# }}}

autoload -U select-word-style
select-word-style bash
# bindkey '^\' zsh_gh_copilot_explain  # bind Ctrl+\ to explain
# bindkey '^[\' zsh_gh_copilot_suggest  # bind Alt+\ to suggest
bindkey '^e' edit-command-line
bindkey '^ ' forward-word
bindkey '^U' kill-whole-line
bindkey -v '^?' backward-delete-char
 # Ctrl-w - delete a full WORD (including colon, dot, comma, quotes...)
# my-backward-kill-word () {
#     # Add colon, comma, single/double quotes to word chars
#     local WORDCHARS='*?_-.[]~=/&;!#$%^(){}<>:,"'"'"
#     zle -f kill # Append to the kill ring on subsequent kills.
#     zle backward-kill-word
# }
# zle -N my-backward-kill-word
# bindkey '^w' my-backward-kill-word
#}}}
# alias sourcing {{{
ALIAS_DIR="$HOME/aliases"
make_home_dir "aliases"
src_all_aliases
#}}}
# random aliases {{{
alias ports='netstat -tulpn'
alias r='fc -e -'
alias rr='source ~/.zshrc'
alias here='curl wttr.in/37067'
alias home='curl wttr.in/37055'
alias t='todo.sh'
alias fname='basename'
alias notes='terminal_velocity'
#alias tmux='TERM=xterm-256color tmux 2> /dev/null '
alias html='w3m -I %{charset} -T text/html'
alias rmcodes='sed -r "s/[[:cntrl:]]\[[0-9]{1,3}m//g"'
alias icat="kitty +kitten icat"
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
function yd(){
  local in
  read in
  echo $in | tr -d '\n' | copy
}
#fix zsh-vi-mode clipboard stuff {{{
my_zvm_vi_yank() {
  zvm_vi_yank
  echo -en "${CUTBUFFER}" | copy
}

my_zvm_vi_delete() {
  zvm_vi_delete
  echo -en "${CUTBUFFER}" | copy
}

my_zvm_vi_change() {
  zvm_vi_change
  echo -en "${CUTBUFFER}" | copy
}

my_zvm_vi_change_eol() {
  zvm_vi_change_eol
  echo -en "${CUTBUFFER}" | copy
}

my_zvm_vi_put_after() {
  CUTBUFFER=$(paste)
  zvm_vi_put_after
  zvm_highlight clear # zvm_vi_put_after introduces weird highlighting for me
}

my_zvm_vi_put_before() {
  CUTBUFFER=$(paste)
  zvm_vi_put_before
  zvm_highlight clear # zvm_vi_put_before introduces weird highlighting for me
}

zvm_after_lazy_keybindings() {
  zvm_define_widget my_zvm_vi_yank
  zvm_define_widget my_zvm_vi_delete
  zvm_define_widget my_zvm_vi_change
  zvm_define_widget my_zvm_vi_change_eol
  zvm_define_widget my_zvm_vi_put_after
  zvm_define_widget my_zvm_vi_put_before

  zvm_bindkey visual 'y' my_zvm_vi_yank
  zvm_bindkey visual 'd' my_zvm_vi_delete
  zvm_bindkey visual 'x' my_zvm_vi_delete
  zvm_bindkey vicmd  'C' my_zvm_vi_change_eol
  zvm_bindkey visual 'c' my_zvm_vi_change
  zvm_bindkey vicmd  'p' my_zvm_vi_put_after
  zvm_bindkey vicmd  'P' my_zvm_vi_put_before
} 
# }}}
# }}}
# program aliases and config edit aliases {{{
alias vim='nvim'
#for adding stuff to the bashrc
alias conf='vim ~/.zshrc'
alias lconf='nvim ~/.lzshrc'
alias reconf='source ~/.zshrc'
alias vconf='vim ~/.config/nvim/init.lua'
alias iconf='vim ~/.ideavimrc'
alias mconf='vim ~/.muttrc'
# }}}
# spaceship config {{{
cyan_replacement=208
# }}}
# cd aliases {{{
function cd_up() {
        z $(printf "%0.s../" $(seq 1 $1 ));
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
export EDITOR='nvim'
function v(){
        if [ -z $NVIM_LISTEN_ADDRESS ]; then
                nvim "$@"
        else
                nvr "$@"
        fi
}
function clear_nvim_swap(){
        rm $HOME/.local/share/nvim/swap/*
}
alias cns=clear_nvim_swap
# }}}
if [ -f $HOME/.lzshrc ]; then
        source $HOME/.lzshrc
else
        echo "no local zshrc"
fi
# }}}
eval "$(zoxide init zsh)"
zvm_after_init_commands+=(eval "$(atuin init zsh --disable-up-arrow)")
zvm_bindkey vicmd '^r' atuin-search
alias cd='z'
bindkey '^u' kill-whole-line
bindkey '^e' edit-command-line
# sdk man required boilerplate {{{
#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
# }}}
# turn on direnv support {{{
eval "$(direnv hook zsh)"
# }}}

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

