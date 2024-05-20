#!/bin/bash

# THESE FUNCTIONS WILL BE IMPORTED IN .zshrc

# Search all folders
function sa() {
	cd $HOME
	cd $(find . -maxdepth 5 -type d | grep -v "node_modules" | grep -v "venv" | fzf)
}

# Search for folders in $HOME/projects
function sd() {
	cd $HOME/projects
	cd $(find * -maxdepth 4 -type d \( -name '.*' -prune -o -print \) |
		grep -v "node_modules" | grep -v "venv" | fzf)
}

function sc() {
	cd $(git rev-parse --show-toplevel)
	cd $(fdfind -t d | fzf)
}
