#!/bin/bash

sudo apt-get update
sudo apt-get upgrade
sudo apt-get --assume-yes install vim curl htop ranger tmux wget git build-essential libcairo2-dev libpango1.0-dev libjpeg-dev libgif-dev librsvg2-dev

sudo timedatectl set-timezone America/Los_Angeles

cd ./scripts
./install-nvim.sh
