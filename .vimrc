" No compatibility with vi, unleash the power
set nocompatible

" Disable detection of file type
filetype off

" Set behavior of the backspace to remove after beginning of line
set backspace=2

" Set up Pathogen
execute pathogen#infect()

" Airline
set laststatus=2 " Displays all the time
let g:airline_extensions = []

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

function! DoPrettyXML()
  " save the filetype so we can restore it later
  let l:origft = &ft
  set ft=
  " delete the xml header if it exists. This will
  " permit us to surround the document with fake tags
  " without creating invalid xml.
  1s/<?xml .*?>//e
  " insert fake tags around the entire document.
  " This will permit us to pretty-format excerpts of
  " XML that may contain multiple top-level elements.
  0put ='<PrettyXML>'
  $put ='</PrettyXML>'
  silent %!xmllint --format -
  " xmllint will insert an <?xml?> header. it's easy enough to delete
  " if you don't want it.
  " delete the fake tags
  2d
  $d
  " restore the 'normal' indentation, which is one extra level
  " too deep due to the extra tags we wrapped around the document.
  silent %<
  " back to home
  1
  " restore the filetype
  exe "set ft=" . l:origft
endfunction
command! PrettyXML call DoPrettyXML()

abbr pry require 'pry'; binding.pry<Esc>

set backupdir=~/.vim/.backup//
set directory=~/.vim/.swp//
set undodir=~/.vim/.undo//
" This is for cron to work
" http://vim.wikia.com/wiki/Editing_crontab
au BufEnter /private/tmp/crontab.* setl backupcopy=yes

" Hook up the ack plugin to the Silver Searcher
let g:ackprg = 'ag --vimgrep --smart-case'
cnoreabbrev ag Ack
cnoreabbrev aG Ack
cnoreabbrev Ag Ack
cnoreabbrev AG Ack

" Auto delete trailing whitespaces
autocmd BufWritePre * %s/\s\+$//e
