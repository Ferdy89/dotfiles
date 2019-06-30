#!/usr/bin/env bash

git submodule deinit -f -- "vim/.vim/bundle/$1"
rm -rf ".git/modules/vim/.vim/bundle/$1"
git rm -f "vim/.vim/bundle/$1"
