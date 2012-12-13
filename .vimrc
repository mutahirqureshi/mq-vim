call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

autocmd FileType c,cpp,java,php,html,js,css,h,m,rb,erb autocmd BufWritePre <buffer> :%s/\s\+$//e
set shiftwidth=2
set softtabstop=2
set cindent
set tabstop=2
set expandtab
set number
set background=dark

set statusline=%F      "full filename
set statusline+=%m     "modified flag
set statusline+=%r     "read only flag
set statusline+=\ %y     "filetype
set statusline+=%=     "left/right separator
set statusline+=COL%c     "cursor column
set statusline+=\ %l/%L  "cursor line / total lines
set statusline+=\ %P   "percent through file
set laststatus=2

syntax on
filetype plugin on

map <C-\> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

"Added by android-vim:
set tags+=/Users/mqureshi/.vim/tags
autocmd Filetype java setlocal omnifunc=javacomplete#Complete
let g:SuperTabDefaultCompletionType = 'context'
