# Ferdy89 Dotfiles

Awesome for Tmux & Vim combo on Mac OSX or Linux

## Installation

```bash
git clone --recursive https://github.com/Ferdy89/dotfiles.git ~/.dotfiles
ln -s .dotfiles/.vim* .
ln -s .dotfiles/.tmux* .
```

## Update

```bash
git submodule foreach git pull origin master
```

## Add new Vim plugins

```bash
git submodule add <url_to_github_repo_from_plugin> .vim/bundle/<plugin_name>
```
