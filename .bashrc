# ~/.bashrc

# Source Nix environment
if [ -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ]; then
  . '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
fi

# Initialize starship prompt
if command -v starship &> /dev/null; then
    eval "$(starship init bash)"
fi

# Useful aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# Git aliases
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gl='git pull'
alias gd='git diff'
alias gb='git branch'
alias gco='git checkout'

# Modern replacements (if available)
if command -v eza &> /dev/null; then
    alias ls='eza'
    alias ll='eza -alF'
    alias la='eza -A'
    alias tree='eza --tree'
fi

if command -v bat &> /dev/null; then
    alias cat='bat'
fi

if command -v fd &> /dev/null; then
    alias find='fd'
fi

# Development aliases
alias nv='nvim'
alias vim='nvim'

# Nix aliases for configuration management
alias nix-rebuild='darwin-rebuild switch --flake ~/.config/nix-config#macos'
alias nix-update='cd ~/.config/nix-config && nix flake update && cd -'

# Set better history
export HISTSIZE=10000
export HISTFILESIZE=20000
export HISTCONTROL=ignoredups:erasedups

# Append to history, don't overwrite
shopt -s histappend

# Check window size after each command
shopt -s checkwinsize

# Enable programmable completion
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Set up fzf key bindings and fuzzy completion
eval "$(fzf --bash)"