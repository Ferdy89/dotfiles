" No compatibility with vi, unleash the power
set nocompatible

" Disable detection of file type
filetype off

call plug#begin()
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-rails'
Plug 'mileszs/ack.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-scripts/Align'
Plug 'w0rp/ale'
Plug 'tpope/vim-sensible'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-rhubarb'
Plug 'nelstrom/vim-markdown-folding'
Plug 'dbeniamine/cheat.sh-vim'
call plug#end()

" Airline
let g:airline_extensions = []

" Solarized theme
set background=dark
colorscheme solarized

" Tabs
set tabstop=2
set shiftwidth=2
set expandtab

autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1

set number
set colorcolumn=80
highlight ColorColumn ctermbg=24
set hlsearch
set ignorecase
set smartcase
set spell spelllang=en_us

" Show trailing whitespace:
:highlight ExtraWhitespace ctermbg=red guibg=red
:match ExtraWhitespace /\s\+$/

" Auto delete trailing whitespaces
autocmd BufWritePre * %s/\s\+$//e

" CtrlP
let g:ctrlp_user_command = ['.git/', 'cd %s && git ls-files . -oc --exclude-standard']
set wildignore+=*/tmp/*,*/node_modules/*,*/log/*,*/vendor/*

" NERDTree customization and configuration
noremap <C-m> :NERDTreeFind<CR>
" TODO: I want C-m to be open nerdtree in all, plus find current file OR close
" all, including while within nerdtree
let g:NERDTreeMapJumpNextSibling = '<Esc>'
let g:NERDTreeMapJumpPrevSibling = '<Esc>'

" My own custom mappings for tabs and panes
noremap <C-j>  gT
noremap <C-k>  gt
noremap <C-e>  <C-w><C-w>
noremap <C-u>  :Gblame<CR>

" Allow mouse manipulation
set mouse=a

set clipboard=unnamedplus

" Disable parenthesis (and similars) parent highlight match for improved
" performance
let loaded_matchparen = 1

" Copy filename into clipboard
noremap <silent> <C-x> :let @+ = expand("%") <CR>

nnoremap <Leader>q :bwipeout<CR>
nnoremap <Leader>w :write<CR>

abbr pry require 'pry'; binding.pry<Esc>
abbr frozes # frozen_string_literal: true<Esc>

set backupdir=~/.vim/.backup//
set directory=~/.vim/.swp//
set undodir=~/.vim/.undo//
" This is for cron to work
" http://vim.wikia.com/wiki/Editing_crontab
au BufEnter /private/tmp/crontab.* setl backupcopy=yes

" Hook up the ack plugin to the Silver Searcher
let g:ackprg = 'ag --vimgrep --smart-case'
cnoreabbrev ag LAck

" Fugitive's status line
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P

" vim-ruby config
let g:ruby_indent_assignment_style = 'variable'

" Rust auto formatting
let g:rustfmt_autosave = 1

let g:ale_sign_column_always = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_set_loclist = 0
let g:ale_fix_on_save = 1

let g:markdown_fold_style = 'nested'
autocmd Syntax markdown normal zR

" https://stackoverflow.com/a/7321131
function! DeleteInactiveBufs()
    "From tabpagebuflist() help, get a list of all buffers in all tabs
    let tablist = []
    for i in range(tabpagenr('$'))
        call extend(tablist, tabpagebuflist(i + 1))
    endfor

    "Below originally inspired by Hara Krishna Dara and Keith Roberts
    "http://tech.groups.yahoo.com/group/vim/message/56425
    let nWipeouts = 0
    for i in range(1, bufnr('$'))
        if bufexists(i) && !getbufvar(i,"&mod") && index(tablist, i) == -1
        "bufno exists AND isn't modified AND isn't in the list of buffers open in windows and tabs
            silent exec 'bwipeout' i
            let nWipeouts = nWipeouts + 1
        endif
    endfor
    echomsg nWipeouts . ' buffer(s) wiped out'
endfunction
command! Bdi :call DeleteInactiveBufs()
