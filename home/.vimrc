" portions taken from:
"  * Amir Salihefendic, https://github.com/amix/vimrc
"  * https://dougblack.io/words/a-good-vimrc.html


" ------------------------------
"  General
" ------------------------------

" Set to auto read when a file is changed from the outside
set autoread

" Fixes an issue with the background color when on a tmux terminal
" https://sunaku.github.io/vim-256color-bce.html
set t_ut=


" ------------------------------
"  User Interface
" ------------------------------

" show line numbers
set number

" Ignore case on search
set ignorecase

" Search as characters are entered
set incsearch

" highlight search matches
set hlsearch

" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>


" ------------------------------
"  Editor
" ------------------------------

" Syntax highlighting
syntax enable

" Enable 256 colors palette in Gnome Terminal
if $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif

" Colorscheme
set background=dark
colorscheme badwolf

" Set utf8 as standard encoding
set encoding=utf8

" highlight current line
"set cursorline

" highlight matching [{()}]
set showmatch


" ------------------------------
"  Files, backups and undo
" ------------------------------

" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile


" ------------------------------
"  Text, tab and indent related
" ------------------------------

" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

set ai " Auto indent
set si " Smart indent
set wrap " Wrap lines
