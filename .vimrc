" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

Plug 'vim-scripts/AutoTag'
Plug 'rking/ag.vim'
Plug 'Rip-Rip/clang_complete'
Plug 'vim-scripts/cocoa.vim'
Plug 'wincent/Command-T'
Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-fugitive'
Plug 'vim-scripts/javacomplete'
Plug 'scrooloose/nerdtree'
Plug 'taiansu/nerdtree-ag'
Plug 'ervandew/supertab'
Plug 'vim-scripts/taglist.vim'
Plug 'tpope/vim-rails'
Plug 'cschlueter/vim-wombat'
Plug 'scrooloose/nerdcommenter'
Plug 'altercation/vim-colors-solarized'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Initialize plugin system
call plug#end()

"------------------------------------------------------------------------------------

autocmd FileType c,cpp,java,php,html,js,css,h,m,rb,erb,es6 autocmd BufWritePre <buffer> %s/\s\+$//e
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

"Command-T stuff
let g:CommandTMaxFiles=50000

"Added by android-vim:
autocmd Filetype java setlocal omnifunc=javacomplete#Complete
let g:SuperTabDefaultCompletionType = 'context'

"Enable mouse
set ttyfast
set mouse=n
set ttymouse=xterm2

colorscheme solarized

"yank copies to OSX clipboard
set clipboard=unnamed

" airline
let g:airline_theme='solarized'
set laststatus=2

