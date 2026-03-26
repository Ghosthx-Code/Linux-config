#!/bin/bash
# Update package lists
echo "Updating packages..."
sudo apt update
# Install Core Aesthetic & Info Tools
echo "Installing aesthetic tools..."
sudo apt install -y fastfetch htop btop cmatrix lolcat
sudo apt install -y fonts-symbols-nerd-font
# Set up 'bat' (Ubuntu names it 'batcat')
mkdir -p ~/.local/bin
ln -s /usr/bin/batcat ~/.local/bin/bat
# Optional: Add aliases to .zshrc for the new tools
echo "Adding aliases to ~/.zshrc..."
{
    echo "# Custom CLI Aliases"
    echo "alias ls='eza --icons'"
    echo "alias ll='eza -lh --icons'"
    echo "alias cat='bat'"
    echo "eval \"\$(zoxide init bash)\""
    echo "fastfetch"
} >> ~/.zshrc
echo "Done! Restart your terminal or run 'source ~/.bashrc' to see changes."