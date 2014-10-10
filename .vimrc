" No compatibility with vi, unleash the power
set nocompatible

" Disable detection of file type
filetype off

" Set behavior of the backspace (??)
set backspace=2

" ========================================================================
" Vundle stuff
" ========================================================================
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Let Vundle manage Vundle (required)!
Bundle 'gmarik/vundle'

" My bundles
Bundle 'thoughtbot/vim-rspec'
Bundle 'kien/ctrlp.vim'
Bundle 'kchmck/vim-coffee-script'
Bundle 'digitaltoad/vim-jade'
Bundle 'tpope/vim-rails'
Bundle 'bling/vim-airline'
Bundle 'tpope/vim-fugitive'

" Airline
set laststatus=2

" ================
" Ruby stuff
" ================
syntax on                 " Enable syntax highlighting
syntax enable
filetype plugin indent on " Enable filetype-specific indenting and plugins

" Solarized theme
set background=dark
colorscheme solarized

" Tabs
set tabstop=2
set shiftwidth=2
set expandtab
set autoindent

augroup myfiletypes
  " Clear old autocmds in group
  autocmd!
  autocmd FileType ruby,eruby,yaml setlocal path+=lib
augroup END

if has("autocmd")
  " ProShip code
  autocmd BufRead *.pss set filetype=vb tabstop=4 shiftwidth=4 expandtab
endif

set number
set colorcolumn=80
highlight ColorColumn ctermbg=4
set hlsearch

" Show trailing whitespace:
:highlight ExtraWhitespace ctermbg=red guibg=red
:match ExtraWhitespace /\s\+$/

" RSpec.vim stuff
let g:rspec_command = "!bundle exec spec {spec}"
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

" CtrlP
let g:ctrlp_user_command = ['.git/', 'cd %s && git ls-files . -oc --exclude-standard']
set wildignore+=*/tmp/*,*/node_modules/*,*/log/*,*/vendor/*
