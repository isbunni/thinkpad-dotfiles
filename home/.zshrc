# starship prompt
eval "$(starship init zsh)"

# History
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history
setopt HIST_IGNORE_DUPS
setopt SHARE_HISTORY

# Completions
autoload -Uz compinit
compinit
setopt COMPLETE_IN_WORD
setopt ALWAYS_TO_END
setopt AUTO_MENU
setopt AUTO_LIST
setopt AUTO_PARAM_SLASH
setopt EXTENDED_GLOB
unsetopt MENU_COMPLETE
unsetopt FLOW_CONTROL

# Key bindings
bindkey -e

# Aliases
alias ls="ls --color=auto"
alias ll="ls -la"
alias la="ls -A"
alias grep="grep --color=auto"
alias ..="cd .."

# Editor
export EDITOR=nvim
