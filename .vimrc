call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

autocmd FileType c,cpp,java,php,html,js,css,h,m,rb,erb autocmd BufWritePre <buffer> :%s/\s\+$//e
set shiftwidth=2
set softtabstop=2
set cindent
set tabstop=2
set expandtab
set number
set ruler
set background=dark

"set statusline=%F      "full filename
"set statusline+=%m     "modified flag
"set statusline+=%r     "read only flag
"set statusline+=\ %y     "filetype
"set statusline+=%=     "left/right separator
"set statusline+=COL%c     "cursor column
"set statusline+=\ %l/%L  "cursor line / total lines
"set statusline+=\ %P   "percent through file
"set laststatus=2

syntax on
filetype plugin on

map <C-\> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

"Added by android-vim:
autocmd Filetype java setlocal omnifunc=javacomplete#Complete
let g:SuperTabDefaultCompletionType = 'context'

"Enable mouse
set ttyfast
set mouse=n
set ttymouse=xterm2

"JavaImp setup
let g:JavaImpPaths = $HOME . "/vim/JavaImp/jmplst," .
  \ "/Applications/Android-SDK/platforms/android-16," .
  \ $HOME . "/workspace/tagme_android/ext/ImageLoader/src," .
  \ $HOME . "/workspace/tagme_android/ext/fastimage-lib/src," .
  \ $HOME . "/workspace/tagme_android/app/src," .
  \ $HOME . "/workspace/tagme_android/app/libs"

let g:JavaImpDataDir = $HOME . "/vim/JavaImp"
exe "set dict=" . g:JavaImpDataDir . "/JavaImp.txt" 
set complete-=k 
set complete+=k
