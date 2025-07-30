# Search folders in current git repository
function sc
    if not git status >/dev/null 2>&1
        echo "Not in a git repository"
        return 1
    end

    cd (git rev-parse --show-toplevel)
    cd (find . -type d | grep -vE "(node_modules|venv|\.git|\.idea)" | fzf)
end
