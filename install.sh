#!/usr/bin/env bash

ln -s dotfiles/.vim* ~/
ln -s dotfiles/.tmux* ~/

cat > ~/.config/nvim/init.vim <<EOF
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc
EOF
