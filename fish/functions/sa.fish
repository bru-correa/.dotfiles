# Search all folders
function sa
	cd $HOME
	cd $(find . -maxdepth 5 -type d | grep -v "node_modules" | grep -v "venv" | fzf)
end
