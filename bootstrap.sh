#!/bin/bash
set -e

# Get dotfiles directory
DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "Setting up dotfiles from $DOTFILES_DIR..."

# Set bash as default shell
if [[ "$SHELL" != */bash ]]; then
    chsh -s "$(which bash)"
    echo "Changed default shell to bash"
fi

# Link dotfiles
echo "Linking dotfiles..."
ln -sf "$DOTFILES_DIR/.bashrc" "$HOME/.bashrc"
echo "  * .bashrc -> $DOTFILES_DIR/.bashrc"
ln -sf "$DOTFILES_DIR/.tmux.conf" "$HOME/.tmux.conf"
echo "  * .tmux.conf -> $DOTFILES_DIR/.tmux.conf"

# Create config directories and link
echo "Linking config directories..."
mkdir -p "$HOME/.config"
ln -sf "$DOTFILES_DIR/nvim" "$HOME/.config/nvim"
echo "  * .config/nvim -> $DOTFILES_DIR/nvim"
ln -sf "$DOTFILES_DIR/starship.toml" "$HOME/.config/starship.toml"
echo "  * .config/starship.toml -> $DOTFILES_DIR/starship.toml"
ln -sf "$DOTFILES_DIR/alacritty" "$HOME/.config/alacritty"
echo "  * .config/alacritty -> $DOTFILES_DIR/alacritty"

# Source bashrc in bash_profile (only if not already present)
if ! grep -q "source ~/.bashrc" "$HOME/.bash_profile" 2>/dev/null; then
    echo '[[ -f ~/.bashrc ]] && source ~/.bashrc' >> "$HOME/.bash_profile"
    echo "Added bashrc sourcing to bash_profile"
else
    echo "bashrc sourcing already present in bash_profile"
fi

echo "Dotfiles setup complete! Run: source ~/.bashrc"