#!/usr/bin/env bash

# Package installation script (non-GUI packages only)
# Generated from nix-config packages

set -e

echo "Installing packages..."

# Detect package manager
if command -v brew &> /dev/null; then
    PM="brew"
elif command -v apt-get &> /dev/null; then
    PM="apt"
elif command -v dnf &> /dev/null; then
    PM="dnf"
elif command -v pacman &> /dev/null; then
    PM="pacman"
else
    echo "No supported package manager found"
    exit 1
fi

echo "Using package manager: $PM"

# Core utilities
PACKAGES=(
    "curl"
    "wget"
    "unzip"
    "zip"
    "tree"
    "htop"
    "btop"
    "git"
    "jq"
    "neovim"
    "ripgrep"
    "fd"
    "fzf"
    "bat"
    "nmap"
    "netcat"
    "tmux"
)

# Package manager specific packages
case $PM in
    brew)
        PACKAGES+=(
            "azure-cli"
            "kubectl"
            "kubectx"
            "helm"
            "terraform"
            "argocd"
            "kubecolor"
            "lazygit"
            "ansible"
            "pyenv"
            "gh"
            "yq"
            "node@24"
            "eza"
            "starship"
            "rust"
        )
        ;;
    apt)
        PACKAGES+=(
            "ansible"
            "python3-pip"
            "netcat-openbsd"
        )
        # kubectl, helm, terraform need manual installation
        echo "Note: kubectl, helm, terraform, argocd, azure-cli need to be installed separately on apt systems"
        ;;
    dnf)
        PACKAGES+=(
            "ansible"
            "python3-pip"
            "nmap-ncat"
        )
        echo "Note: kubectl, helm, terraform, argocd, azure-cli need to be installed separately on dnf systems"
        ;;
    pacman)
        PACKAGES+=(
            "kubectl"
            "kubectx"
            "helm"
            "terraform"
            "ansible"
            "python-pyenv"
            "github-cli"
            "nodejs"
            "rust"
        )
        ;;
esac

# Install packages
case $PM in
    brew)
        for pkg in "${PACKAGES[@]}"; do
            if ! brew list "$pkg" &>/dev/null; then
                echo "Installing $pkg..."
                brew install "$pkg"
            else
                echo "✓ $pkg already installed"
            fi
        done
        ;;
    apt)
        sudo apt-get update
        for pkg in "${PACKAGES[@]}"; do
            if ! dpkg -l | grep -q "^ii  $pkg "; then
                echo "Installing $pkg..."
                sudo apt-get install -y "$pkg"
            else
                echo "✓ $pkg already installed"
            fi
        done
        ;;
    dnf)
        for pkg in "${PACKAGES[@]}"; do
            if ! rpm -q "$pkg" &>/dev/null; then
                echo "Installing $pkg..."
                sudo dnf install -y "$pkg"
            else
                echo "✓ $pkg already installed"
            fi
        done
        ;;
    pacman)
        for pkg in "${PACKAGES[@]}"; do
            if ! pacman -Q "$pkg" &>/dev/null; then
                echo "Installing $pkg..."
                sudo pacman -S --noconfirm "$pkg"
            else
                echo "✓ $pkg already installed"
            fi
        done
        ;;
esac

# Post-installation setup
if command -v pyenv &> /dev/null; then
    echo "✓ pyenv installed - run 'pyenv install <version>' to install Python versions"
fi

echo ""
echo "Installation complete!"
