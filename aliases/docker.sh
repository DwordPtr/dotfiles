#docker aliases
alias dconf='nvim $HOME/aliases/docker.sh'
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
