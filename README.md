# Dotfiles

Simple dotfiles configuration for shell and application settings.

## Structure

```
dotfiles/
├── .bashrc          # Bash shell configuration
├── .tmux.conf       # Terminal multiplexer settings
├── bootstrap.sh     # Setup script to link dotfiles
├── alacritty/       # Terminal emulator config
├── nvim/            # Neovim editor configuration
└── starship/        # Shell prompt configuration
```

## Quick Setup

```bash
cd ~/dotfiles
./bootstrap.sh
```

## What It Does

The bootstrap script will:
- Set bash as your default shell
- Create symbolic links for shell config files
- Link application configs to `~/.config/`
- Add bashrc sourcing to your bash_profile

## Manual Linking

```bash
# Shell configurations
ln -sf ~/dotfiles/.bashrc ~/.bashrc
ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf

# Application configurations
mkdir -p ~/.config
ln -sf ~/dotfiles/nvim ~/.config/nvim
ln -sf ~/dotfiles/starship ~/.config/starship
ln -sf ~/dotfiles/alacritty ~/.config/alacritty
```

## Integration

Works alongside nix-config for complete development environment setup.