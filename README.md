# Ferdy89 Dotfiles

Awesome for Oh My Zsh, Tmux & Vim combo on Mac OS or Linux

## Installation

```bash
git clone https://github.com/Ferdy89/dotfiles.git && cd dotfiles

# Use GNU Stow to symlink each config set to the home directory
stow vim
stow tmux
stow zsh
```

## Dependencies

Neovim and Tmux are necessary. These dotfiles are optimized to be used with zsh
and the oh-my-zsh package. [The Silver
Searcher](https://github.com/ggreer/the_silver_searcher#installing) is
recommended for searching in Vim.

### Opinionated features

* Move across tmux windows with C-h and C-l
* Move across vim tabs with C-j and C-k
* In tmux, the leader key is switched to C-s for convenience
* In vim, C-p fuzzy searches file names, :Ag searches file contents
* In vim, C-m shows the file tree structure, C-u shows git blame sidebar
* Vim abbreviations: 'pry' and 'frozes'
* In tmux, use Leader | and Leader - to create vertical and horizontal splits
* Control which nested tmux session is active with Shift-up and Shift-down

### Vim Ale plugins

[Full list of supported tools](https://github.com/w0rp/ale#1-supported-languages-and-tools)
