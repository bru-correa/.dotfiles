# Search for folders in $HOME/projects
function sd
	cd $HOME/projects
	cd $(find * -maxdepth 4 -type d \( -name '.*' -prune -o -print \) |
		grep -v "node_modules" | grep -v "venv" | fzf)
end
