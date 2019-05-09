#git aliases

alias gconf='nvim $HOME/aliases/git_aliases.sh'
alias fb='git branch -a | fzf | xargs git checkout'
alias add='git ls-files -m | xargs git add'
alias hard='git reset HEAD --hard'
alias clean='git clean -fd'
alias dev='git checkout development'
alias master='git checkout master'
alias lsha="git log -1 | top | awk '{print $2}'"
alias sb='git rev-parse --abbrev-ref HEAD'
alias g='git'
alias gnp='git --no-pager'
alias devdifffiles='git diff development  --name-only'
alias gdevdiff='nvim -p $(devdifffiles) -c "tabdo :Gdiff development"'
# this taught me to worry about space before linebreaks lol
function get_agg_files_for_ticket(){
	gnp log --grep=$1 |\
		rg commit | awk '{print $2}' | xargs git show |\
		rg -e  '\+\+\+|\-\-\-' | awk '{print $2}' | \
		xargs -I {} basename {} | sort | uniq
}
function checkeckout_by_pattern(){
	# remotes is a klugde come back
	# in the future and make more robust
	branch=`glb | rg -vi remotes | rg $1 | tr -d " \'"`
	if [ -z "$branch" ]; then
		echo not found
	else
		git checkout $branch
	fi
}
alias rgc='checkeckout_by_pattern'
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
alias gt='git tag'
alias gcl='git clone'
alias gcb='git checkout -'
alias gck='git checkout'
alias gmast='git checkout master'
alias gatrac='git_add_tracked'
alias gunad='git reset HEAD'
alias gad='git add --a'
alias gpullr='git pull --rebase origin $(sb)'
alias gpull='git pull origin $(sb)'
alias gp='gpull'
alias gs='git status'
alias gf='git fetch'
alias gd='git diff'
alias gdc='git diff --cached'
alias gndc='gnp diff --cached'
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
