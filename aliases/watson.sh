alias w='watson'
alias wt='watson status'
alias wl='watson log'
alias ws='watson start'
alias wr='watson restart'
function start(){
	watson stop
	watson start $1
	echo what text to append?
	read dash-text
	git checkout origin development
	jira issue take $1
	git pull origin development
	git checout feature/$1-$dash-text
}
