# terjia aliases
alias jconf='nvim $HOME/aliases/terjira_aliases.sh'
alias j='jira'
alias ji='jira issue'
alias jio='jira issue open'
alias jls='jira issue ls'
#jira issue comment
function jic(){
	jira issue comment -E $1
}
