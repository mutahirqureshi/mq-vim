set nocompatible
let mapleader=","

" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

Plug 'tpope/vim-sensible'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
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
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-rails'
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
" }}}

if has('nvim') || has('patch-8.0.902')
  Plug 'mhinz/vim-signify'
else
  Plug 'mhinz/vim-signify', { 'tag': 'legacy' }
endif
" {{{
" default updatetime 4000ms is not good for async update
set updatetime=100
" }}}

Plug 'scrooloose/syntastic'
" {{{
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
" }}}

"disable this plugin due to change highlighted text delay:
" https://github.com/christoomey/vim-system-copy/issues/2
"Plug 'christoomey/vim-system-copy'
Plug 'mkitt/tabline.vim'
Plug 'morhetz/gruvbox'
" {{{
  let g:gruvbox_italic=0
  let g:gruvbox_contrast_dark='hard'
  let g:gruvbox_contrast_light='hard'

  set t_ut=
" }}}
"
Plug 'thaerkh/vim-workspace'
" {{{
  nnoremap <leader>s :ToggleWorkspace<CR>
  let g:workspace_autosave_always = 1
" }}}

Plug 'konfekt/vim-select-replace'

Plug 'kshenoy/vim-signature'
" {{{
" ]" -> next global mark
  nnoremap ]" :<C-U>call signature#mark#Goto("next", "spot", "global")<CR>

" [" -> previous global mark
  nnoremap [" :<C-U>call signature#mark#Goto("prev", "spot", "global")<CR>
" }}}

Plug 'ludovicchabant/vim-lawrencium'

Plug 'maxbrunsfeld/vim-yankstack'

" Initialize plugin system
call plug#end()

"------------------------------------------------------------------------------------

autocmd FileType c,cpp,java,php,html,js,css,h,m,rb,erb,es6,py autocmd BufWritePre <buffer> %s/\s\+$//e
" stricter indenting rules for C programs
set cindent
" when indenting with '>', use 2 spaces width
set shiftwidth=2
" show existing tab with 2 spaces width
set tabstop=2
set softtabstop=2
" On pressing tab, insert spaces instead
set expandtab
set number

let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
set termguicolors
silent! colorscheme gruvbox
set background=dark

"Enable mouse
set ttyfast
set mouse=n
set ttymouse=xterm2

" Open new split panes to the right and bottom
set splitbelow
set splitright

" Highlight current cursor position
set cursorline

try
  source ~/.vimrc.local
catch
endtry

"This needs to run after all plugins have loaded
filetype plugin indent on
