# ~/.bashrc

##########################################
# --------------- GENERAL ---------------#
##########################################

# Set better history
HISTSIZE=10000
HISTFILESIZE=20000
HISTCONTROL=ignoredups:erasedups                                                           # avoids duplicates
shopt -s histappend                                                                        # appends instead of overwriting the history file
PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a; history -c; history -r" # appends new history lines immediately

# Check window size after each command
shopt -s checkwinsize

# Initialize pyenv
if command -v pyenv &>/dev/null; then
  export PYENV_ROOT="$HOME/.pyenv"
  [[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init -)"
fi

# Set up fzf key bindings and fuzzy completion
if command -v fzf &>/dev/null; then
  eval "$(fzf --bash)"
fi

# Initialize starship prompt
if command -v starship &>/dev/null; then
  eval "$(starship init bash)"
fi

# Autocomplete for kubectl
source <(kubectl completion bash)
complete -o default -F __start_kubectl k

# Set neovim as default editor
export EDITOR=nvim
export VISUAL=nvim
export FCEDIT=nvim

# Enable vi keybindings
set -o vi

##########################################
# --------------- ALIASES ---------------#
##########################################

# grep aliases
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# Git aliases
if command -v git &>/dev/null; then
  alias gs='git status'
  alias ga='git add'
  alias gc='git commit'
  alias gp='git push'
  alias gl='git pull'
  alias gd='git diff'
  alias gb='git branch'
  alias gco='git checkout'
fi

# Modern replacements
if command -v eza &>/dev/null; then
  alias ls='eza'
  alias ll='eza -alF'
  alias la='eza -A'
  alias tree='eza --tree'
fi

if command -v bat &>/dev/null; then
  alias cat='bat'
fi

if command -v fd &>/dev/null; then
  alias find='fd'
fi

# Vim aliases to Neovim
if command -v nvim &>/dev/null; then
  alias nv='nvim'
  alias vim='nvim'
  alias v='nvim'
  alias vi='nvim'
fi

# Nix aliases for configuration management
if command -v darwin-rebuild &>/dev/null; then
  alias nix-rebuild='darwin-rebuild switch --flake ~/.config/nix-config#macos'
fi

if command -v nix &>/dev/null; then
  alias nix-update='cd ~/.config/nix-config && nix flake update && cd -'
fi

# kubectl aliases
if command -v kubecolor &>/dev/null; then
  alias k='kubecolor'
elif command -v kubectl &>/dev/null; then
  alias k='kubectl'
fi

if command -v kubectx &>/dev/null; then
  alias kctx='kubectx'
fi

if command -v kubens &>/dev/null; then
  alias kns='kubens'
fi

# Kubecolor does not apply to these aliases
if command -v kubectl &>/dev/null; then
  # Get commands
  alias kg='k get'
  alias kgp='k get pods'
  alias kgs='k get services'
  alias kgd='k get deployments'
  alias kgi='k get ingress'
  alias kga='k get all'

  # Delete commands
  alias kdel='k delete'
  alias kdelp='k delete pod'
  alias kdels='k delete service'
  alias kdelr='k delete deployment'
  alias kdeli='k delete ingress'
  alias kdela='k delete all'

  # Describe commands
  alias kd='k describe'
  alias kdp='k describe pod'
  alias kds='k describe service'
  alias kdd='k describe deployment'
  alias kdi='k describe ingress'
  alias kda='k describe all'

  alias kl='k logs'
fi

# Start a tmux session automatically if tmux is installed
if command -v tmux &>/dev/null; then
  # Only start tmux if not already inside a tmux session
  if [ -z "$TMUX" ]; then
    SESSION_NAME="main"

    # Check if session exists
    if ! tmux has-session -t "$SESSION_NAME" 2>/dev/null; then
      # Create the first window and name it 'shell'
      tmux new-session -d -s "$SESSION_NAME" -n shell

      # Create additional windows and name them
      tmux new-window -t "$SESSION_NAME:2" -n ide
      tmux new-window -t "$SESSION_NAME:3" -n jumphost
    fi

    # Attach to the session
    tmux attach -t "$SESSION_NAME"
  fi
fi
