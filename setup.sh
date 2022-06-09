#!/bin/bash

# Install vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# Install neovim
sudo apt-get install neovim

# Place link of nvim file into .config
mkdir  ~/.config/nvim

# Place link of nvim file into home directory

# Append source of repo's .bashrc file to existing .bashrc file
echo "source ~/dotfiles/.bashrc" >> ~/.bashrc




