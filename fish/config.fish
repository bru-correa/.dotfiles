source /usr/share/cachyos-fish-config/cachyos-config.fish

# overwrite greeting
# potentially disabling fastfetch
#function fish_greeting
#    # smth smth
#end

alias vim nvim
alias avim "NVIM_APPNAME=astronvim nvim"

fish_add_path -m ~/bin/

fish_ssh_agent

~/.local/bin/mise activate fish | source
