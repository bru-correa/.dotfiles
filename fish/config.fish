# source /usr/share/cachyos-fish-config/cachyos-config.fish

# overwrite greeting
# potentially disabling fastfetch
function fish_greeting
end

# Replace ls with eza
alias ls='eza -al --color=always --group-directories-first --icons' # preferred listing
alias la='eza -a --color=always --group-directories-first --icons'  # all files and dirs
alias ll='eza -l --color=always --group-directories-first --icons'  # long format
alias lt='eza -aT --color=always --group-directories-first --icons' # tree listing
alias l.="eza -a | grep -e '^\.'"                                   # show only dotfiles

# Common use
alias tarnow='tar -acf '
alias untar='tar -zxvf '

alias lvim "NVIM_APPNAME=lvim nvim"

alias avim "NVIM_APPNAME=astrovim nvim"

alias pn pnpm

alias sign-front "tmuxp load sign-front"

fish_add_path -m ~/bin

set -gx KUBECONFIG "/home/bcorrea/.kube/sign129"

source "$HOME/.cargo/env.fish"

fish_ssh_agent

~/.local/bin/mise activate fish | source

starship init fish | source

# pnpm
set -gx PNPM_HOME "/home/bcorrea/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end
