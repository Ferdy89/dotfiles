" No compatibility with vi, unleash the power
set nocompatible

" Disable detection of file type
filetype off

" Set behavior of the backspace to remove after beginning of line
set backspace=2

" ========================================================================
" Vundle stuff
" ========================================================================
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Let Vundle manage Vundle (required)!
Bundle 'gmarik/vundle'

" My bundles
Bundle 'kien/ctrlp.vim'
Bundle 'kchmck/vim-coffee-script'
Bundle 'tpope/vim-rails'
Bundle 'bling/vim-airline'
Bundle 'tpope/vim-fugitive'
Bundle 'scrooloose/nerdtree'
Bundle 'ag.vim'
Bundle 'godlygeek/tabular'
Bundle 'tpope/vim-endwise'
Bundle 'msanders/snipmate.vim'
Bundle 'airblade/vim-gitgutter'
Bundle 'jistr/vim-nerdtree-tabs'
Bundle 'Xuyuanp/nerdtree-git-plugin'

" Airline
set laststatus=2 " Displays all the time

syntax on                 " Enable syntax highlighting
syntax enable
filetype plugin indent on " Enable filetype-specific indenting and plugins

" Solarized theme
" Not sure why, but if not, vim solarized does not work properly with terminal solarized
set t_Co=256
set background=dark
colorscheme solarized

" Tabs
set tabstop=2
set shiftwidth=2
set expandtab
set autoindent

autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1

set number
set colorcolumn=80
highlight ColorColumn ctermbg=4
set hlsearch
set incsearch
set ignorecase
set smartcase

set nostartofline " restart at last cursor position - YAY!
set scrolloff=10  " keep 10 lines above and below position

" Show trailing whitespace:
:highlight ExtraWhitespace ctermbg=red guibg=red
:match ExtraWhitespace /\s\+$/

" CtrlP
let g:ctrlp_user_command = ['.git/', 'cd %s && git ls-files . -oc --exclude-standard']
set wildignore+=*/tmp/*,*/node_modules/*,*/log/*,*/vendor/*

" NERDTree customization and configuration
noremap <C-m> :NERDTreeFind<CR>
" TODO: I want C-m to be open nerdtree in all, plus find current file OR close
" all, including while within nerdtree
let g:NERDTreeMapJumpNextSibling = '<Esc>'
let g:NERDTreeMapJumpPrevSibling = '<Esc>'
let g:nerdtree_tabs_open_on_console_startup = 1

" My own custom mappings for tabs and panes
map <C-j> <Esc>:tabprev<CR>
map <C-k> <Esc>:tabnext<CR>
map <C-e> <C-w><C-w>
map <C-u> <Esc>:Gblame<CR>

" Allow mouse manipulation
set mouse=a

set clipboard=unnamed

" Disable parenthesis (and similars) parent highlight match for improved
" performance
let loaded_matchparen = 1

" All swap and backup files out of working directory
set directory=~/.vim/tmp
set backupdir=~/.vim/tmp

" Copy filename into clipboard
noremap <silent> <C-x> :let @+ = expand("%") <CR>
