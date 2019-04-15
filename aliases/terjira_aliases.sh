# terjia aliases
alias jconf='nvim $HOME/aliases/terjira_aliases.sh'
alias j='jira'
alias ji='jira issue'
alias jio='jira issue open'
#jira issue comment
function jic(){
	jira issue comment -E $1
}
