set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

" No compatibility with vi, unleash the power
set nocompatible

filetype plugin indent on
syntax on

call plug#begin()

if filereadable($HOME . "/.config/nvim/config/machine-plugins.vim")
  source $HOME/.config/nvim/config/machine-plugins.vim
endif

Plug 'Raimondi/delimitMate'
Plug 'airblade/vim-gitgutter'
Plug 'alvan/vim-closetag'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'mileszs/ack.vim'
Plug 'nelstrom/vim-markdown-folding'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-sensible'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-scripts/Align'
Plug 'vim-scripts/vcscommand.vim'
Plug 'w0rp/ale'
call plug#end()

source $HOME/.config/nvim/config/keys.vim
source $HOME/.config/nvim/config/plugins.vim
source $HOME/.config/nvim/config/theme.vim

if filereadable($HOME . "/.config/nvim/config/machine.vim")
  source $HOME/.config/nvim/config/machine.vim
endif

" Tabs
set tabstop=2
set shiftwidth=2
set expandtab

set number
set hlsearch
set ignorecase
set smartcase
set spell spelllang=en_us

" Show trailing whitespace:
:highlight ExtraWhitespace ctermbg=red guibg=red
:match ExtraWhitespace /\s\+$/

" Auto delete trailing whitespaces
autocmd BufWritePre * %s/\s\+$//e

" Allow mouse manipulation
set mouse=a

set clipboard=unnamedplus

" Disable parenthesis (and similars) parent highlight match for improved
" performance
let loaded_matchparen = 1

set backupdir=~/.vim/.backup//
set directory=~/.vim/.swp//
set undodir=~/.vim/.undo//
" This is for cron to work
" http://vim.wikia.com/wiki/Editing_crontab
au BufEnter /private/tmp/crontab.* setl backupcopy=yes

" Rust auto formatting
let g:rustfmt_autosave = 1

let g:markdown_fold_style = 'nested'
autocmd Syntax markdown normal zR

" copy to attached terminal using the yank(1) script:
" https://github.com/sunaku/home/blob/master/bin/yank
function! Yank(text) abort
  let escape = system('yank', a:text)
  if v:shell_error
    echoerr escape
  else
    call writefile([escape], '/dev/tty', 'b')
  endif
endfunction
noremap <silent> <Leader>y y:<C-U>call Yank(@0)<CR>
