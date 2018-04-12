#!/bin/bash

# Setup dotfiles

ln -s `readlink -f .tmux.conf` $HOME
ln -s `readlink -f .bashrc` $HOME
ln -s `readlink -f .tmuxline.conf` $HOME
ln -s `readlink -f .bin` $HOME
ln -s `readlink -f init.vim` $HOME/.config/nvim/
