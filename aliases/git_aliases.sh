#git aliases

alias gconf='nvim $HOME/aliases/git_aliases.sh'
alias hard='git reset HEAD --hard'
alias clean='git clean -fd'
alias dev='git checkout development'
alias master='git checkout master'
alias lsha="git log -1 | top | awk '{print $2}'"
alias sb='git rev-parse --abbrev-ref HEAD'
function git_add_tracked(){
   if [[ $# -eq 0  ]] ; then
      git ls-files --modified | xargs git add
   else
      git ls-files --modified | grep "$@" | xargs git add
   fi
 }
function git_commit_method(){
    if [[ $# -eq 0 ]] ; then
        git commit
    else
        git commit -m "$@"  #this doesn't work yet
    fi
}
#get commits on a ticket
function find_ticket_commits(){
    if [[ $# -eq 0 ]] ; then
        echo noargs srsly
    else
        git log --author=btidwell --grep=$1 -i
    fi
}
alias fct='find_ticket_commits'
alias gc='git_commit_method'
alias gcb='git checkout -'
alias gck='git checkout'
alias gmast='git checkout master'
alias gatrac='git_add_tracked'
alias gunad='git reset HEAD'
alias gad='git add --a'
alias gpullr='git pull --rebase origin $(sb)'
alias gpull='git pull origin $(sb)'
alias gs='git status'
alias gr='git reset'
alias gpsh='git push origin $(sb)'
alias gad='git ls-files -m | xargs git add'
alias glb='git branch -a'
alias url='git config --get remote.origin.url'

#pullNpush
alias gplsh='gpullr && gpsh'

alias gdiff='git difftool --tool=meld'
alias diff='git difftool --tool=meld --dir-diff'

alias stash='git stash' #make function for including ticket number
alias apply='git stash apply'
alias drop='git stash drop'
alias list='git stash list'
alias curr='git log -1'
#get issue based on current branch
alias bi="sb | tr -d 'feature/'"
# stash based on issue
alias is='bi | xargs -I {} git stash save {}'
