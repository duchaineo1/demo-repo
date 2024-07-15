#!/usr/bin/env bash

set -euo pipefail

# Cli apps
apt-get install -y wget git curl fzf ripgrep bat eza zoxide btop unzip fontconfig gcc ca-certificates gnupg

# Setup npm
mkdir -p /etc/apt/keyrings
curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg
export NODE_MAJOR="20"
echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_$NODE_MAJOR.x nodistro main" | tee /etc/apt/sources.list.d/nodesource.list
apt-get update && apt-get install -y nodejs

# Setup font
mkdir -p $HOME/Downloads
cd ~/Downloads
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/CascadiaMono.zip
unzip CascadiaMono.zip -d CascadiaFont
mkdir -p ~/.local/share/fonts
cp CascadiaFont/*.ttf ~/.local/share/fonts
fc-cache
cd -

# Setup nvim
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
rm -rf /opt/nvim
tar -C /opt -xzf nvim-linux64.tar.gz
echo "export PATH='$PATH:/opt/nvim-linux64/bin'" >> $HOME/.bashrc
# Setup nvchad

git clone https://github.com/duchaineo1/demo-repo.git
mv demo-repo/nvim-config/ $HOME/.config

# Install lazygit
cd ~/Downloads
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
install lazygit /usr/local/bin
cd -

# Configure alacritty for Tokyo Night theme
mkdir -p ~/.config/alacritty
cat << EOF >> ~/.config/alacritty/alacritty.toml
[env]
TERM = "xterm-256color"
[window]
padding.x = 16
padding.y = 14
decorations = "none"
[font]
normal = { family = "CaskaydiaMono Nerd Font", style = "Regular" }
size = 9
[keyboard]
bindings = [
{ key = "F11", action = "ToggleFullscreen" }
]
[colors]
[colors.primary]
background = '#1a1b26'
foreground = '#a9b1d6'
# Normal colors
[colors.normal]
black = '#32344a'
red = '#f7768e'
green = '#9ece6a'
yellow = '#e0af68'
blue = '#7aa2f7'
magenta = '#ad8ee6'
cyan = '#449dab'
white = '#787c99'
# Bright colors
[colors.bright]
black = '#444b6a'
red = '#ff7a93'
green = '#b9f27c'
yellow = '#ff9e64'
blue = '#7da6ff'
magenta = '#bb9af7'
cyan = '#0db9d7'
white = '#acb0d0'
[colors.selection]
background = '#7aa2f7'
EOF
