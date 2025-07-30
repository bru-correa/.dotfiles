# Search all folders
function sa
    cd $HOME
    cd (find . -maxdepth 3 -type d |
    grep -vE "(node_modules|venv|\.git|\.idea)" | fzf)
end
