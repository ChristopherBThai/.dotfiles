#!/bin/bash

wget --quiet https://github.com/neovim/neovim/releases/download/stable/nvim.appimage --output-document vim

chmod +x nvim
sudo chown root:root nvim

sudo mv vim /usr/bin

mkdir -p ~/.config/nvim
cat <<EOT >> ~/.config/nvim/init.vim
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc
EOT

curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

