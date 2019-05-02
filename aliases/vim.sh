alias vaconf='vim ~/$HOME/aliases/vim.sh'
function vim_which(){
	vim `which $1`
}
#todo add autocomplete
alias vw='vim_which'
