alias w='watson'
alias wt='watson status'
alias wl='watson log'
alias ws='watson start'
alias wr='watson restart'
function start(){
	watson stop
	watson start $1
	git checkout development
	jira issue take $1
	jira issue trans $1 "In Progress"
	git pull origin development
	git checkout -B feature/"$1"-"$2"
}
alias wconf='nvim $HOME/aliases/watson.sh'
