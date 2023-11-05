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

# TODO: find the problem and fix it later
fix_touchpad() {
	sudo modprobe -r hid_multitouch
	sudo modprobe hid_multitouch
}

git_current_branch() {
	git branch --show-current
}

procenv() {
	(
	PID=$1
	FNAME=${FUNCNAME[0]}
	usage() {
		echo "USAGE: $FNAME <PID>"
	}
	if [ -z "$PID" ]; then
		usage
		return 0
	fi
	FILE=/proc/$PID/environ
	if [ ! -r "$FILE" ]; then
		echo "Either a process with that ID doesn't exist, or you don't have the correct permission to access it."
		usage
		return 101
	fi
	sed 's:\x0:\n:g' "$FILE" | bat -l sh --style="numbers,grid"
	)
}
