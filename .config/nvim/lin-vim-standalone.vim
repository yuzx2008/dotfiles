set nocompatible

" bell
set noerrorbells
set novisualbell
if has("gui_running")
    " gui bell
    autocmd GUIEnter * set vb t_vb=
endif

" file writing
set autoread
set autowrite
set ruler
set magic
set showmatch
set noundofile
set nobackup
set noswapfile
set nowritebackup

" Don’t show the intro message when starting Vim
set shortmess=atI

" encoding

" set fileformat=unix
" set fileformats=unix,dos,mac
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1,gbk
set termencoding=utf-8
set encoding=utf-8

" mouse
set mouse=c

" plugins
set noignorecase
filetype on
filetype plugin on
filetype indent on

" syntax
syntax on
syntax enable

" no menu window
set completeopt=menu

" indent
set cindent
set smartindent
set autoindent
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab smarttab

" display
set showcmd
set hlsearch
set backspace=indent,eol,start whichwrap+=<,>,[,]
set wrap
set clipboard+=unnamed
set listchars=tab:>-,trail:~,extends:>,precedes:<
" set list
set modifiable

set cursorline
set scrolloff=5
set nocursorcolumn
set norelativenumber
set number
set laststatus=2
set lazyredraw
set ttyfast
set hidden
set updatetime=300
set cmdheight=1
set regexpengine=1

if has("gui_running")
    " gvim toolbox
    set guioptions-=T
    " gvim menu
    set guioptions-=m
endif
