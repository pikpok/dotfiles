#!/bin/bash

# Setup dotfiles

ln -s `readlink -f .tmux.conf` $HOME
ln -s `readlink -f .bashrc` $HOME
ln -s `readlink -f .bash_profile` $HOME
ln -s `readlink -f .tmuxline.conf` $HOME
ln -s `readlink -f init.vim` $HOME/.config/nvim/
ln -s `readlink -f .local` $HOME
