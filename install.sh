#!/usr/bin/env bash

pushd ~

ln -s dotfiles/.vimrc .
ln -s dotfiles/.vim .
ln -s dotfiles/.tmux.conf .

mkdir -p .config/nvim

cat > ~/.config/nvim/init.vim <<EOF
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc
EOF

popd
