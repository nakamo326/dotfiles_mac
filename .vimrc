"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=$HOME/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
call dein#begin($HOME . '/.cache/dein')

" Let dein manage dein
" Required:
call dein#add($HOME . '/.cache/dein/repos/github.com/Shougo/dein.vim')

let s:toml      = '$HOME/dotfiles/dein.toml'
let s:lazy_toml = '$HOME/dotfiles/dein_lazy.toml'
" Add or remove your plugins here like this:
"call dein#add('Shougo/neosnippet.vim')
"call dein#add('Shougo/neosnippet-snippets')
"call dein#load_toml(s:toml,      {'lazy': 0})
"call dein#load_toml(s:lazy_toml, {'lazy': 1})
call dein#add('vim-airline/vim-airline')
call dein#add('vim-airline/vim-airline-themes')
call dein#add('bronson/vim-trailing-whitespace')
call dein#add('Yggdroot/indentLine')
call dein#add('tomasr/molokai')
call dein#add('joshdick/onedark.vim')
call dein#add('toupeira/vim-desertink')
call dein#add('sainnhe/gruvbox-material')
call dein#add('sheerun/vim-polyglot')
call dein#add('preservim/nerdtree')

" Required:
call dein#end()

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------

set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

set hlsearch
set number
set ignorecase
set incsearch
set smartcase
set autoindent
set shiftwidth=4
set wildmenu
set ruler
set tabstop=4
set cursorline
nnoremap j gj
nnoremap k gk
nnoremap <down> gj
nnoremap <up> gk
nnoremap  <C-j> }
nnoremap  <C-k> {
" autocmd vimenter * NERDTree
map <C-n> :NERDTreeToggle<CR>
set showmatch
set laststatus=2
set list
set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%

" color scheme
set background=dark
let g:gruvbox_material_background = 'hard'
colorscheme gruvbox-material
let g:airline_theme = 'gruvbox_material'
