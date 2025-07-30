# Search for folders in $HOME/projects
function sd
    if not ls $HOME/projects >/dev/null 2>&1
        echo "You need to create a 'projects' folder in your home directory"
        return 1
    end

    cd $HOME/projects
    cd (find * -maxdepth 2 -type d \( -name '.*' -prune -o -print \) |
		grep -vE "(node_modules|venv|\.git|\.idea)" | fzf)
end
