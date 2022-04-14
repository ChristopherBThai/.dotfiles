#!/bin/bash

sudo snap install ripgrep --classic

wget --quiet https://github.com/neovim/neovim/releases/download/stable/nvim.appimage --output-document vim

chmod +x vim
sudo chown root:root vim

sudo mv vim /usr/bin

mkdir -p ~/.config/nvim
cat <<EOT >> ~/.config/nvim/init.vim
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc
EOT

cp ../configs/vim/.vimrc ~/.vimrc

curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

