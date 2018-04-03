"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" theme
syntax enable
set background=dark

" tabs
set tabstop=2
set softtabstop=2
set expandtab " tabs are spaces

set number
set cursorline

" search
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
nnoremap <leader><space> :nohlsearch<CR>

nnoremap <C-h> :bprevious<CR>
nnoremap <C-l>   :bnext<CR>
nnoremap <C-t>     :new<CR>
imap <C-h> <Esc>:bprevious<CR>i
imap <C-l>   <Esc>:bnext<CR>i
inoremap <C-t>     <Esc>:new<CR>
map <C-n> :NERDTreeToggle<CR>

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'default'

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

let g:ale_fixers = {
\   'javascript': ['eslint'],
\}

let g:ale_fix_on_save = 1
let g:airline#extensions#tmuxline#enabled = 0

" Required:
set runtimepath+=/home/pikpok/.local/share/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/home/pikpok/.local/share/dein')
  call dein#begin('/home/pikpok/.local/share/dein')

  " Let dein manage dein
  " Required:
  call dein#add('/home/pikpok/.local/share/dein/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here:
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')
  call dein#add('vim-airline/vim-airline')
  call dein#add('vim-airline/vim-airline-themes')
  call dein#add('cloudhead/neovim-fuzzy')
  call dein#add('pangloss/vim-javascript')
  call dein#add('neoclide/vim-jsx-improve')
  call dein#add('ryanoasis/vim-devicons')
  call dein#add('scrooloose/nerdtree')
  call dein#add('Xuyuanp/nerdtree-git-plugin')
  call dein#add('w0rp/ale')
  call dein#add('jdkanani/vim-material-theme')
  " call dein#add('edkolev/tmuxline.vim')

  " You can specify revision/branch/tag.
  call dein#add('Shougo/deol.nvim', { 'rev': 'a1b5108fd' })

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

nnoremap <C-p> :FuzzyOpen<CR>

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------

