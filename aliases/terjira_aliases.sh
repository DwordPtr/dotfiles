# terjia aliases
alias jconf='nvim $HOME/aliases/terjira_aliases.sh'
alias j='jira'
alias ji='jira issue'
alias jls='jira issue ls'
function jio(){
	if [ "$#" = "0" ]; then
		jira issue open `i`
	else 
		jira issue open $1
	fi
}
#jira issue comment
function jc(){
	if [ "$#" = "0" ]; then
		jira issue comment -E `i`
	else 
		jira issue comment -E $1
	fi
}
function jt(){
	if [ "$#" = "0" ]; then
		jira issue trans `i`
	else
		jira issue trans $1
	fi
}
