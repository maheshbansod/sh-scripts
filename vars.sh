
export PATH=~/bin:$PATH

git_current_branch() {
	git branch --show-current
}

git_branch_formatted() {
	local current_branch=$(git_current_branch 2> /dev/null)
	if [[ ! -z "$current_branch" ]]; then
		echo -e "\uE0A0 $current_branch"
	fi
}
export PS1=" \e[34;1m\W\e[0m \$(git_branch_formatted)\n \$ "

export HISTCONTROL=ignoreboth
