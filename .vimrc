
" be iMproved, required
set nocompatible
" required
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file://~/.yuzx/vim_plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
" Plugin 'user/L9', {'name': 'newL9'}

" =================
" Track the engine.
Plugin 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'

" " Trigger configuration. Do not use <tab> if you use
" https://github.com/Valloric/YouCompleteMe.
" UltiSnips 的 tab 键与 YCM 冲突，重新设定
let g:UltiSnipsExpandTrigger="<leader><tab>"
let g:UltiSnipsJumpForwardTrigger="<leader><tab>"
let g:UltiSnipsJumpBackwardTrigger="<leader><s-tab>"
let g:UltiSnipsUsePythonVersion = 2

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" filesystem tree
Plugin 'scrooloose/nerdtree'
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" map <C-n> :NERDTreeToggle<CR>
" map <Leader>n :NERDTree %:p:h<CR>
"-------------------
" :ERDtree 打开 NERD_tree        
" :NERDtreeClose 关闭 NERD_tree
" o 打开关闭文件或者目录
" t 在标签页中打开
" T 在后台标签页中打开
" ! 执行此文件
" p 到上层目录
" P 到根目录
" K 到第一个节点
" J 到最后一个节点
" u 打开上层目录
" m 显示文件系统菜单（添加、删除、移动操作）
" r 递归刷新当前目录
" R 递归刷新当前根目录
"---------------------
" F3 NERDTree 切换
map <F9> :NERDTreeToggle<CR>
imap <F9> <ESC>:NERDTreeToggle<CR>
" 使用 NERDTree 插件查看工程文件。设置快捷键，速记：file list
nmap <Leader>fl :NERDTreeToggle<CR>
" 设置NERDTree子窗口宽度
let NERDTreeWinSize=32
" 设置NERDTree子窗口位置
let NERDTreeWinPos="left"
" 显示隐藏文件
let NERDTreeShowHidden=1
" NERDTree 子窗口中不显示冗余帮助信息
let NERDTreeMinimalUI=1
" 删除文件时自动删除文件对应 buffer
let NERDTreeAutoDeleteBuffer=1


Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
let g:vim_markdown_folding_disabled=1

Plugin 'suan/vim-instant-markdown'
let g:instant_markdown_slow = 1
let g:instant_markdown_autostart = 0

Plugin 'Valloric/YouCompleteMe'

Plugin 'jiangmiao/auto-pairs'

" quick google search
Plugin 'szw/vim-g'

Plugin 'Chiel92/vim-autoformat'
noremap <F3> :Autoformat<CR><CR>

Plugin 'Lokaltog/vim-easymotion'

Plugin 'rking/ag.vim'

Plugin 'vim-scripts/DrawIt'

Plugin 'tpope/vim-eunuch'

Plugin 'vim-scripts/DeleteTrailingWhitespace'

" all lanugage support
Plugin 'sheerun/vim-polyglot'

" change surroundins - cs/ds/ysiw/yss
Plugin 'tpope/vim-surround'

" do syntax check
Plugin 'scrooloose/syntastic'

" fuzzy file find
Plugin 'kien/ctrlp.vim'

" ansible yaml support
Plugin 'chase/vim-ansible-yaml'

" PowerLine 插件，状态栏增强展示
Bundle 'Lokaltog/vim-powerline'
" vim 有一个状态栏，加 powline 则有两状态栏
set laststatus=2
" 指定配色方案为 256 色
" set t_Co=256
let g:Powline_symbols='fancy'

"Plugin 'JarrodCTaylor/vim-shell-executor'
"Plugin 'vim-scripts/Conque-Shell'

" =================
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" 设置快捷键前缀，即：<Leader>
let mapleader=","

" Use the OS clipboard by default (on versions compiled with `+clipboard`)
" set clipboard=unnamed " for mac osx
set clipboard=unnamedplus " for ubuntu

" Enhance command-line completion（vim 自身命令行模式智能补全）
set wildmenu

" Allow cursor keys in insert mode
set esckeys

" Allow backspace in insert mode
set backspace=indent,eol,start

" Optimize for fast terminal connections
set ttyfast

" Add the g flag to search/replace by default
set gdefault

" Use UTF-8 without BOM
set encoding=utf-8 nobomb

" 自动判断文件编码时，依次尝试
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1

" Don’t add empty newlines at the end of files
set binary
set noeol

" Centralize backups, swapfiles and undo history
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
if exists("&undodir")
  set undodir=~/.vim/undo
endif

" Don’t create backups when editing files in certain directories
set backupskip=/tmp/*,/home/yuzx/data/temp

" Respect modeline in files
set modeline
set modelines=4

" Enable per-directory .vimrc files and disable unsafe commands in them
set exrc
set secure

" Enable line numbers（行号）
set number

" Highlight current line（高亮当前行/列）
set cursorline
" 高亮当前列
" set cursorcolumn（Tab 宽度）

" Make tabs as wide as two spaces
set tabstop=2
" 设置自动对齐空格数
set shiftwidth=2
" 退格一次删 2 个空格
set softtabstop=2
" 退格一次删 2 个空格
set smarttab
" Tab 自动转换成空格，需要 Tab 时用 [Ctrl + V + Tab]
set expandtab

" Show “invisible” characters
set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_

" set list

" Highlight searches（高亮搜索结果）
set hlsearch

" Ignore case of searches
set ignorecase

" Highlight dynamically as pattern is typed（搜索时大小写不敏感）
set incsearch

" Always show status line（总显示状态栏）
set laststatus=2

" Enable mouse in all modes（Vim 可鼠标，防止终端下无法拷贝）
set mouse=a

" Disable error bells
set noerrorbells

" Don’t reset cursor to start of line when moving around.
set nostartofline

" Show the cursor position（显示光标位置）
set ruler

" Don’t show the intro message when starting Vim
set shortmess=atI

" Show the current mode
set showmode

" Show the filename in the window titlebar
set title

" Show the (partial) command as it’s being typed（状态栏显示正输入的命令）
set showcmd

" Use relative line numbers
"if exists("&relativenumber")
" set relativenumber
" au BufReadPost * set relativenumber
"endif

" Start scrolling three lines before the horizontal window border
set scrolloff=3

" Strip trailing whitespace (,ss)
function! StripWhitespace()
  let save_cursor = getpos(".")
  let old_query = getreg('/')
  :%s/\s\+$//e
  call setpos('.', save_cursor)
  call setreg('/', old_query)
endfunction
noremap <leader>ss :call StripWhitespace()<CR>
" Save a file as root (,W)
noremap <leader>W :w !sudo tee % > /dev/null<CR>

" Automatic commands
if has("autocmd")
  " Enable file type detection
  filetype on
  " Treat .json files as .js
  autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript
  " Treat .md files as Markdown
  autocmd BufNewFile,BufRead *.md setlocal filetype=markdown
endif

au FileType html setl sw=2 sts=2 et
au FileType css setl sw=2 sts=2 et

" basic keymapping
noremap <leader>c :! compass compile<CR>

" web page
noremap <leader>gh :! google-chrome https://github.com<CR>

" 选中文本块复制至系统剪贴板
vnoremap <Leader>y "+y
" 系统剪贴板内容粘贴至 vim
nmap <Leader>p "+p

" 跳转至右方窗口
nnoremap <Leader>wl <C-W>l
" 跳转至左方窗口
nnoremap <Leader>wh <C-W>h
" 跳转至上方窗口
nnoremap <Leader>wk <C-W>k
" 跳转至下方窗口
nnoremap <Leader>wj <C-W>j

" Buffers 操作快捷方式
nnoremap <C-RETURN> :bnext<CR>
nnoremap <C-S-RETURN> :bprevious<CR>

" Tab 操作快捷方式
nnoremap <C-TAB> :tabnext<CR>
nnoremap <C-S-TAB> :tabprev<CR>

" tab 快捷键
nnoremap <Leader>tn :tabnext<cr>
nnoremap <Leader>tp :tabprevious<cr>
nnoremap <Leader>td :tabnew .<cr>
nnoremap <Leader>te :tabedit
nnoremap <Leader>tc :tabclose<cr>

" 设置 markdown filetype
nnoremap <leader>md :set filetype=markdown<CR>
nnoremap <leader>mp :InstantMarkdownPreview<CR>

" 将 pathogen 自身也置于独立目录，指定其路径
" runtime bundle/vim-pathogen-2.3/autoload/pathogen.vim
" 运行 pathogen
" execute pathogen#infect()

" gvim 字体（用 \ 转义空格，最后指定大小 11）
set guifont=Courier\ 10\ Pitch\ 11

" 禁止折行（全局）
set nowrap

" 设置历史记录数
set history=1000
" 取消备份，禁止临时文件生成
" set nobackup
" set noswapfile

" 设置匹配模式，输入一个左括号时会匹配相应的右括号
set showmatch

" 设置 C/C++ 自动对齐
" set autoindent
" set cindent

" 配色方案
syntax enable
" Enable syntax highlighting
syntax on

" light dark
if has('gui_running')
    set background=light
else
    set background=dark
endif
colorscheme solarized

" colorscheme molokai
" let g:molokai_original = 1
" let g:rehash256 = 1

" colorscheme phd

" Copy = Ctrl+C Paste = Ctrl+V
vmap <C-c> "+yi
vmap <C-x> "+c

" fcitx 退出插入模式时，切换为英文输入法
let g:input_toggle = 1
function! Fcitx2En()
  let s:input_status = system("fcitx-remote")
  if s:input_status == 2
    let g:input_toggle = 1
    let l:a = system("fcitx-remote -c")
  endif
endfunction

function! Fcitx2Zh()
  let s:input_status = system("fcitx-remote")
  if s:input_status != 2 && g:input_toggle == 1
    let l:a = system("fcitx-remote -o")
    let g:input_toggle = 0
  endif
endfunction

set ttimeoutlen=150
" 退出插入模式
autocmd InsertLeave * call Fcitx2En()
" 进入插入模式
"autocmd InsertEnter * call Fcitx2Zh()

" Paste toggle - when pasting something in, don't indent.
set pastetoggle=<F4>

" Python 设置，如：不要 tab 等
autocmd FileType python set tabstop=4 shiftwidth=4 expandtab
autocmd FileType python map <F12> :!python %<CR>

" 设置 markdown 格式自动换行
autocmd FileType markdown set wrap

" 在 bash 中执行光标所在行
nnoremap <leader>b :.w !bash<CR>


