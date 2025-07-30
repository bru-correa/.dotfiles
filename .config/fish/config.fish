source /usr/share/cachyos-fish-config/cachyos-config.fish

# overwrite greeting
# potentially disabling fastfetch
function fish_greeting
end

alias avim "NVIM_APPNAME=astronvim nvim"

alias vim "NVIM_APPNAME=lazyvim nvim"

alias pn pnpm
/home/bcorrea/.local/bin/mise activate fish | source
