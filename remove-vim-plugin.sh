#!/usr/bin/env bash

git submodule deinit -f -- ".vim/bundle/$1"
rm -rf ".git/modules/.vim/bundle/$1"
git rm -f ".vim/bundle/$1"
