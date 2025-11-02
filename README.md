# Dotfiles

Personal configuration for shell, terminal, and development tools.

## Setup

- Cross-platform shell configuration (bash, tmux, starship)
- Neovim editor with LazyVim
- Alacritty terminal emulator
- Bootstrap script for automatic linking
- Optional package installation script

## Quick Start

```bash
# Install packages (optional - works with brew, apt, dnf, pacman)
./install-packages.sh

# Link dotfiles
./bootstrap.sh

# Apply configuration
source ~/.bashrc
```

## Tools Included

Package installation via `install-packages.sh`:

- **Development**: git, gh, jq, yq, nodejs
- **Editors**: neovim, ripgrep, fd, fzf, bat, eza
- **Shell**: starship, tmux
- **Network**: curl, wget, nmap, netcat
- **Cloud/DevOps**: azure-cli, kubectl, kubectx, helm, terraform, argocd, ansible
- **Utilities**: unzip, zip, tree, htop, btop
- **Languages**: rust, pyenv

## Configuration Files

- **`.bashrc`**: Shell configuration with vi keybindings, git/kubectl aliases, auto-tmux
- **`.tmux.conf`**: Terminal multiplexer with `Ctrl+a` prefix, vi navigation, nested session support
- **`starship.toml`**: Shell prompt with time, kubernetes context, git integration
- **`nvim/`**: Neovim configuration based on LazyVim
- **`alacritty/`**: Terminal emulator configuration
- **`bootstrap.sh`**: Automated dotfiles linking script

## Key Features

### Bash

- Vi keybindings for command line editing
- Git aliases (gs, ga, gc, gp)
- Kubectl shortcuts (kg, kgp, kd, kdel)
- FZF integration for fuzzy finding
- Auto-tmux on terminal start

### Tmux

- `Ctrl+a` for outer session, `Ctrl+b` for nested sessions
- Vi navigation (hjkl)
- Easy splits: `v` vertical, `s` horizontal
- Mouse support enabled
- Visual focus with active pane highlighting

### Starship

- Current time display
- Kubernetes context and namespace
- Git branch and status

## Integration with Nix

Works alongside [nix-config](https://github.com/kacperlipka/nix-config) for declarative package management on macOS. Use nix-config for package installation, this repo for configuration files.

## Usage

Clone and run `./bootstrap.sh` to set up dotfiles on any system. For manual linking:

```bash
ln -sf ~/dotfiles/.bashrc ~/.bashrc
ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf
mkdir -p ~/.config
ln -sf ~/dotfiles/nvim ~/.config/nvim
ln -sf ~/dotfiles/starship.toml ~/.config/starship.toml
ln -sf ~/dotfiles/alacritty ~/.config/alacritty
```
