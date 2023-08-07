#!/usr/bin/bash
# Show a dmenu for directories inside the projects directory
p() {
	projects_dir=projects
	red="#FF0000"
	green="#00FF00"
	lines=5
	prompt="Project >"
	dirname=$(find ~/$projects_dir -maxdepth 1 -mindepth 1 -type d -printf "%f\n" | dmenu -b -p "$prompt" --nf "$green" --sb "$red" -l $lines --font "FiraCode-21")
	if [ -n "$dirname" ]; then
		cd ~/"$projects_dir"/"$dirname" || return
	fi
}
