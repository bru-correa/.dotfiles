function sc
	cd $(git rev-parse --show-toplevel)
	cd $(fdfind -t d | fzf)
end
