#!/bin/bash

sudo apt-get update
sudo apt-get upgrade
sudo apt-get --assume-yes install vim curl htop ranger tmux wget git build-essential libcairo2-dev libpango1.0-dev libjpeg-dev libgif-dev librsvg2-dev snapd

sudo timedatectl set-timezone America/Los_Angeles

# Install neovim
cd ./scripts
./install-nvim.sh
cd ../

# Install nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash

# Tmux config
cp ./configs/tmux/.tmux.conf ~/.tmux.conf

# Bash config
cp ./configs/bash/.bash_aliases ~/.bash_aliases
