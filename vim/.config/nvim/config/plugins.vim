" Airline
let g:airline_extensions = []

" CtrlP
let g:ctrlp_user_command = ['.git/', 'cd %s && git ls-files . -oc --exclude-standard']
set wildignore+=*/tmp/*,*/node_modules/*,*/log/*,*/vendor/*

" NERDTree customization and configuration
noremap <C-t> :NERDTreeFind<CR>
" TODO: I want C-t to be open nerdtree in all, plus find current file OR close
" all, including while within nerdtree
let g:NERDTreeMapJumpNextSibling = '<Esc>'
let g:NERDTreeMapJumpPrevSibling = '<Esc>'

" Hook up the ack plugin to the Silver Searcher
let g:ackprg = 'ag --vimgrep --smart-case'
cnoreabbrev ag LAck

" Fugitive's status line
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P

" vim-ruby config
autocmd FileType ruby,eruby let g:ruby_indent_assignment_style = 'variable'
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1

let g:ale_sign_column_always = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_set_loclist = 0
let g:ale_fix_on_save = 1
