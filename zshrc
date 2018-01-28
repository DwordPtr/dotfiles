# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
# Path to your oh-my-zsh installation.
  export ZSH=/home/bryan/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="work"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git,mvn)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#
#logging
alias curIp="ifconfig | grep inet\ addr | grep -v 127.0.0.1 | awk '{print $2}'"
#text manipulation
noargs='No args? srsly'
function find_dups(){
  if [[ $# -eq 0 ]] ; then
    echo $noargs
    return 1
  fi
  sort $(echo $1) | uniq -c | sort -r |
  grep -v '\s*1\s.*' # removes all lines that occur once
}
function find_dups_blanklines(){
  if [[ $# -eq 0 ]] ; then
    echo $noargs
    return 1
  fi
  sort $(echo $1) | uniq -c | sort -r|
  grep -v '\s*1s.*'| # remove all one liners
  egrep '\s*[[2-9]|\d\d+]\s+$' # remove just newlines
}
alias fdnl='find_dups_blanklines'
alias fd='find_dups'
#git aliases
if [ ! -f $HOME/git_aliases.sh ]; then
	curl -O https://gist.githubusercontent.com/DwordPtr/371c13c887b7349680bb3f446beb628c/raw/2127e82f285ade087a30a8827bd1b3a73a69952f/git_aliases.sh
fi
source $HOME/git_aliases.sh

#maven alias
#alias mvn='/opt/apache-maven-3.1.1/bin/./mvn'
alias sTest='mvn clean install -DskipTests  && notify-send "build done" || notify-send "build failed"'
alias wTest='mvn clean install  && notify-send "build and tests done" || notify-send "build or tests failed"'
alias wTestLog='mvn clean install 2>&1 | tee mvn-log.txt && notify-send "passed" || notify-send "failure logged"'

alias fwTest='mvn clean install -t 4 && notify-send "build and tests done quickly" || notify-send "build or tests quickly failed"'
alias fsTest='mvn clean install -DskipTests -t 4 && notify-send "build done quickly" || notify-send "build failed quickly"'

#smart bear tests
alias sptst='mvn com.smartbear.soapui:soapui-maven-plugin:test'

#wipeout targets
alias whipeout="find -type d -name '*target' | sudo xargs rm -r"
alias rmMvn='rm -r ~/.m2/repository'
repo='/home/bryan/.m2/repository'
rulesInLos='/franklin/american/famc-rule-engine'
rulesInRepo='/com/franklinamerican/rules'
alias clearRules='rm -r $repo$rulesInLos $repo$rulesInRepo' 

alias magic="rmMvn && whipeout && sTest && notify-send 'magic performed' || notify-send 'probably a network problem'"


#network stuff
alias ports='netstat -tulpn'

#docker aliases
alias ds='docker ps'
function dckrma(){
    docker stop `docker ps -aq` &&  docker rm `docker ps -aq` \
    && notify-send 'containers killed' || notify-send 'there was an error'
} 

function dst(){
  if [[ $# -eq 0 ]] ; then
    echo $noargs
    return 1
  fi
  docker start "$@"
}

function dckstp(){
   docker stop `docker ps -aq` && notify-send 'containers stopped' || notify-send 'containers errored on stopping'
}

function hostPort(){
  if [[ $# -eq 0 ]] ; then
    echo $noargs
    return 1
  fi
  docker inspect -f '{{json .NetworkSettings.Ports}}' $1
}
function getSha(){
  if [[ $# -eq 0 ]] ; then
    echo $noargs
    return 1
  fi
  docker ps | grep $1 | awk '{print $1}' 
}


#computer dirs
DOWNLOADS=$HOME/Downloads
alias dl='cd $DOWNLOADS'

scripts='~/scripts_'
alias stopwatch='~/scripts_/./stopwatch.sh'
#jboss server
#weather aliases
alias here='curl wttr.in/37067'
alias home='curl wttr.in/37055'

#clipboard magic
alias clp='xclip -selection clipboard'
alias oclp='xsel --clipboard --output'
#spring boot crap
alias findCont="find . -name '*Controller.java'"


#java version management aliases
alias jav8='export JAVA_HOME=/usr/lib/jvm/java-8-oracle'
alias jav6='export JAVA_HOME=/usr/lib/jvm/java-6-oracle'
alias jav7='export JAVA_HOME=/usr/lib/jvm/java-7-oracle'
alias jav9='export JAVA_HOME=/usr/lib/jvm/java-9-openjdk-amd64'

alias curJav='echo $JAVA_HOME'
jav8 # set java8 as default jdk for now




#ubuntu update stuff
alias u="sudo apt update && sudo apt upgrade && notify-send 'update' || notify-send 'update failed'"
alias up='sudo apt update && sudo apt upgrade'
alias fup='sudo apt update && sudo apt -y upgrade'

#complete up work in progress
#alias cup='up && sudo pip2 install -U && sudo pip3 install -U && sudo snap refresh'

#for adding stuff to the bashrc
alias t='todo.sh'
alias conf='vim ~/.zshrc'
alias reconf='source ~/.zshrc'
alias vconf='vim ~/.vimrc'
alias iconf='vim ~/.ideavimrc'

#debeaver
dbeaverUrl='http://dbeaver.jkiss.org/files/dbeaver-ce_latest_amd64.deb'

#for when forgeting sudo 
alias fuck='sudo !!'

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

#zsh specific stuff
OH_MY_ZSH_DIR=/home/bryan/.oh-my-zsh
alias omz='cd $OH_MY_ZSH_DIR'
#annoying warning about nesting sessions
alias tmux='TERM=xterm-256color tmux 2> /dev/null '
tmux || : #this is a no-op
date
PROMPT_COMMAND='if [ "$(id -u)" -ne 0 ]; then echo "$(date "+%Y-%m-%d.%H:%M:%S") $(pwd) $(fc -l -1)" >> ~/.logs/bash-history-$(date "+%Y-%m-%d").log; fi'

preexec(){ eval $PROMPT_COMMAND }
