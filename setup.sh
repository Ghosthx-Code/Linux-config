#!/bin/bash
# 0. Install the packages
sudo apt update && sudo apt install -y rofi waybar python3 nmap zsh tcpdump qterminal git curl
echo "Config Starts"
# Neovim Setup (The right order)
sudo add-apt-repository -y ppa:neovim-ppa/stable
sudo apt update && sudo apt install -y neovim
[ -d ~/.config/nvim ] && mv ~/.config/nvim ~/.config/nvim.bak
git clone https://github.com/LazyVim/starter ~/.config/nvim
rm -rf ~/.config/nvim/.git

# Rofi & Waybar Config Folders
mkdir -p ~/.config/rofi ~/.config/waybar
rofi -dump-config > ~/.config/rofi/config.rasi
[ -f /etc/xdg/waybar/config ] && cp /etc/xdg/waybar/config ~/.config/waybar/config.jsonc
[ -f /etc/xdg/waybar/style.css ] && cp /etc/xdg/waybar/style.css ~/.config/waybar/style.css

echo "KeyBind"

# GNOME Keybindings
gsettings set org.gnome.settings-daemon.plugins.media-keys terminal "['']"
BIND_PATH="org.gnome.settings-daemon.plugins.media-keys.custom-keybinding"
LIST="['/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/', '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/', '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/']"
gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings "$LIST"

# Shortcut 0: QTerminal
P0="/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/"
gsettings set $BIND_PATH:$P0 name "QTerminal"
gsettings set $BIND_PATH:$P0 command "qterminal"
gsettings set $BIND_PATH:$P0 binding "<Control><Alt>t"

# Shortcut 1: Rofi
P1="/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/"
gsettings set $BIND_PATH:$P1 name "Rofi"
gsettings set $BIND_PATH:$P1 command "rofi -show drun"
gsettings set $BIND_PATH:$P1 binding "<Alt>space"

# Shortcut 2: Kill Rofi
P2="/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/"
gsettings set $BIND_PATH:$P2 name "Kill Rofi"
gsettings set $BIND_PATH:$P2 command "killall rofi"
gsettings set $BIND_PATH:$P2 binding "<Control>space"

# Shortcut 3: Open Waybar
P3="/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom3/"
gsettings set $BIND_PATH:$P2 name "Waybar"
gsettings set $BIND_PATH:$P2 command "waybar &"
gsettings set $BIND_PATH:$P2 binding "<Control><alt>space"

# Shortcut 4: Close Waybar
P4="/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom4/"
gsettings set $BIND_PATH:$P2 name "Waybar"
gsettings set $BIND_PATH:$P2 command "killall -9 waybar"
gsettings set $BIND_PATH:$P2 binding "<Shift><Control><alt>space"