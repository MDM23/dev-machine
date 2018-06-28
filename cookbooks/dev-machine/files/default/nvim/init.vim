call plug#begin('~/.config/nvim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'kien/ctrlp.vim'
Plug 'tpope/vim-surround'
Plug 'itchyny/lightline.vim'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'flazz/vim-colorschemes'
Plug 'vim-scripts/ScrollColors'
"Plug 'gerw/vim-HiLinkTrace'
Plug 'jiangmiao/auto-pairs'
Plug 'terryma/vim-multiple-cursors'
Plug 'scrooloose/nerdcommenter'
Plug 'plasticboy/vim-markdown'
Plug 'rking/ag.vim'
call plug#end()

set nocompatible

" ############################# GENERAL SETTINGS ###############################

set number                      " Display line numbers
set backspace=indent,eol,start  " Allow backspace in insert mode
set history=1000                " Larger history
set showcmd                     " Show incomplete commands
set showmode                    " Show current mode
set gcr=a:blinkon0              " No blinking cursor
set visualbell                  " Disable sounds
set autoread                    " Reload changed files
set hidden
set noswapfile
set nobackup
set nowb
set nowrap
set nofoldenable
set splitbelow
set splitright
set colorcolumn=80
set cursorline
set encoding=utf-8 nobomb
set tw=0
set mouse=a

set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch

set t_Co=256
set background=dark
colorscheme molokai

hi Normal guibg=NONE ctermbg=NONE

syntax on

let mapleader=","

" Persistent undo
if has('persistent_undo') && !isdirectory(expand('~').'/.vim/backups')
  silent !mkdir ~/.vim/backups > /dev/null 2>&1
  set undodir=~/.vim/backups
  set undofile
endif

" Remove trailing blanks before saving
autocmd FileType php,js,ts,md,txt,json,css,scss,html,jade
autocmd BufWritePre <buffer> :%s/\s\+$//e

" ################################ INDENTATION #################################

set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

" Auto indent pasted text
nnoremap p p=`]<C-o>
nnoremap P P=`]<C-o>

" ################################## FOLDING ###################################

set foldmethod=indent   " Fold based on indent
set foldnestmax=3       " Deepest fold is 3 levels
set nofoldenable        " Dont fold by default

" ################################# SCROLLING ##################################

set scrolloff=8         " Start scrolling when we're 8 lines away from margi
set sidescrolloff=15
set sidescroll=1

" ################################# SEARCHING ##################################

set incsearch           " Find the next match as we type the search
set hlsearch            " Highlight searches by default
set ignorecase          " Ignore case when searching...
set smartcase           " ...unless we type a capital

" ################################ NAVIGATION ##################################

map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" ################################# NERDTree ###################################

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | vnew | endif
nnoremap <C-n> :NERDTreeToggle<CR>

" ################################# Airline ####################################

let g:airline_powerline_fonts=1

" ################################## ctrlp #####################################

let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
let g:ctrlp_working_path_mode = ''
