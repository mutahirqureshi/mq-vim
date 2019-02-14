let mapleader=","

" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

Plug 'vim-scripts/AutoTag'
"Plug 'rking/ag.vim'
Plug 'Rip-Rip/clang_complete'
Plug 'vim-scripts/cocoa.vim'

"Plug 'ctrlpvim/ctrlp.vim'
"" {{{
"  set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux

"  let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
"  let g:ctrlp_custom_ignore = {
"    \ 'dir':  '\v[\/]\.(git|hg|svn)$',
"    \ 'file': '\v\.(exe|so|dll|class|apk|aar)$',
"    \ }
"  let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
"" }}}

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" {{{
  " FZF + ripgrep for ag replacement
  " --column: Show column number
  " --line-number: Show line number
  " --no-heading: Do not show file headings in results
  " --fixed-strings: Search term as a literal string
  " --ignore-case: Case insensitive search
  " --no-ignore: Do not respect .gitignore, etc...
  " --hidden: Search hidden files and folders
  " --follow: Follow symlinks
  " --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
  " --color: Search color options
  command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)
  set grepprg=rg\ --vimgrep

  nnoremap <leader>p :History<CR>
  nnoremap <leader>b :Buffers<CR>
  nnoremap <leader>t :Files<CR>
" }}}
"
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
" {{{
  " Align line-wise comment delimiters flush left instead of following code indentation
  let g:NERDDefaultAlign='left'
" }}}

"Plug 'altercation/vim-colors-solarized'
"Plug 'dolph/vim-colors-solarized-black'

Plug 'mutahirqureshi/vim-colors-solarized-black'
" {{{
  let g:solarized_termcolors=256
" }}}

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" {{{
let g:airline_theme='dark'
set laststatus=2
" }}}

Plug 'pangloss/vim-javascript'
Plug 'jelera/vim-javascript-syntax'

"Plug 'klen/python-mode' "Disable due to conflict with vimdiff
"" {{{
"  let g:pymode_lint=0
"" }}}

Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/syntastic'
" {{{
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" }}}

Plug 'christoomey/vim-system-copy'

" Initialize plugin system
call plug#end()

"------------------------------------------------------------------------------------

autocmd FileType c,cpp,java,php,html,js,css,h,m,rb,erb,es6,py autocmd BufWritePre <buffer> %s/\s\+$//e
set shiftwidth=2
set softtabstop=2
set cindent
set tabstop=2
set expandtab
set number
set ruler
set backspace=indent,eol,start

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
filetype plugin indent on

set background=dark
colorscheme solarized
"colorscheme wombat

map <C-\> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

"Enable mouse
set ttyfast
set mouse=n
set ttymouse=xterm2

"yank copies to OSX clipboard
"set clipboard=unnamed
" use vim-system-copy plugin instead

" treat .es6 files as .js
au BufNewFile,BufRead *.es6 set filetype=javascript

