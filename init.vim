
" ===== dein settings =====
if &compatible
  set nocompatible               " Be iMproved
endif

let s:dein_dir = expand('~/.cache/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" get dein if not installed
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

" Required:
if dein#load_state('$HOME/.cache/dein')
  call dein#begin('$HOME/.cache/dein')

  let s:toml      = '$HOME/dotfiles/dein.toml'
  let s:lazy_toml = '$HOME/dotfiles/dein_lazy.toml'

  call dein#load_toml(s:toml,      {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})
  call dein#add('mattn/vim-lsp-settings')
  call dein#add('prabirshrestha/vim-lsp')


  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

" ===== end =====


" ui
set termguicolors
set background=dark
set number
set ruler
set cursorline
set list
set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%
set laststatus=2


set autoindent
set shiftwidth=4
set tabstop=4
set cindent
" set expandtab

" search
set hlsearch
set ignorecase
set incsearch
set smartcase
set wrapscan

set wildmenu

set showmatch
set matchtime=1

" keymap
inoremap <silent> jj <ESC>
nnoremap j gj
nnoremap k gk
nnoremap <down> gj
nnoremap <up> gk
nnoremap  <C-j> }
nnoremap  <C-k> {

