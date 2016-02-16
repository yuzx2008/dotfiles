
" be iMproved, required
set nocompatible
" required
filetype off

" 设置快捷键前缀，即：<Leader>
let mapleader=","

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'Valloric/YouCompleteMe'
" 设 error warning 提示符，如没设，ycm 以 syntastic 的 g:syntastic_warning_symbol g:syntastic_error_symbol 为准
let g:ycm_error_symbol='>>'
let g:ycm_warning_symbol='>*'
" 跳转快捷键，可跳到 definition 和 declaration
nnoremap <leader>gc :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>
nmap <F5> :YcmDiags<CR>
" 全局配置文件路径
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
" 开启基于 tag 的补全，可在这之后添加需要的标签路径
let g:ycm_collect_identifiers_from_tags_files = 1
" 开启语义补全
let g:ycm_seed_identifiers_with_syntax = 1
" 在接受补全后不分裂出一个窗口显示接受的项
set completeopt-=preview
" 不显示开启vim时检查ycm_extra_conf文件的信息
let g:ycm_confirm_extra_conf=0
" 每次重新生成匹配项，禁止缓存匹配项
let g:ycm_cache_omnifunc=0
" 在注释中也可以补全
let g:ycm_complete_in_comments=1
" 输入第一个字符就开始补全
let g:ycm_min_num_of_chars_for_completion=1
" 不查询ultisnips提供的代码模板补全，如果需要，设置成1即可
let g:ycm_use_ultisnips_completer=0

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo

Plugin 'tpope/vim-fugitive'

" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'

" Git plugin not hosted on GitHub
Plugin 'wincent/command-t'

" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file://~/.vim/by_yuzx'

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
let NERDTreeIgnore=['\.vim$', '\~$', '.klive', '.Trash-*', '.git']

Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
let g:vim_markdown_folding_disabled=1
" start chrome has some problem
" nnoremap <F12>c :exe ':silent !google-chrome %'<CR>
" TODO
nnoremap <leader>mp :OpenBrowser "file:///home/yuzx/.vim/1.md?" . expand('%:p')<CR>

" Plugin 'JamshedVesuna/vim-markdown-preview'
" need connect to github.com
" let vim_markdown_preview_github=1
" let vim_markdown_preview_browser='Google Chrome'
" let vim_markdown_preview_hotkey='<C-m>'
" let vim_markdown_preview_hotkey='<leader>mp'


Plugin 'jiangmiao/auto-pairs'

" quick google search
Plugin 'szw/vim-g'

Plugin 'Chiel92/vim-autoformat'
noremap <F3> :Autoformat<CR><CR>

Plugin 'Lokaltog/vim-easymotion'

Plugin 'rking/ag.vim'
let g:agprg="ag --vimgrep"
" configure ag.vim to always start searching from your project root instead of the cwd
let g:ag_working_path_mode="r"

Plugin 'tpope/vim-eunuch'

Plugin 'vim-scripts/DeleteTrailingWhitespace'

" all lanugage support
Plugin 'sheerun/vim-polyglot'

" change surroundins - cs/ds/ysiw/yss
Plugin 'tpope/vim-surround'

" do syntax check
Plugin 'scrooloose/syntastic'

Plugin 'tyru/open-browser.vim'
let g:netrw_nogx = 1 " disable netrw's gx mapping. 
nmap gx <Plug>(openbrowser-smart-search) 
vmap gx <Plug>(openbrowser-smart-search) 
" Open URI under cursor. 
nmap <leader>obu <Plug>(openbrowser-open) 
" Open selected URI. 
vmap <leader>obu <Plug>(openbrowser-open) 
" Search word under cursor. 
" nmap <leader>obs <Plug>(openbrowser-search) 
" Search selected word. vmap map-you-like <Plug>(openbrowser-search) 
" If it looks like URI, Open URI under cursor. 
" Otherwise, Search word under cursor. 
nmap <leader>obs <Plug>(openbrowser-smart-search) 
" If it looks like URI, Open selected URI. 
" Otherwise, Search selected word. 
vmap <leader>obs <Plug>(openbrowser-smart-search) 

" http://editorconfig.org/ && ~/.editorconfig
Plugin 'editorconfig/editorconfig-vim'

" fuzzy file find
Plugin 'kien/ctrlp.vim'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.png,*.jpg,*.jpeg,*.gif,*/software/* " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'

" ctrlp 默认用 grep 搜索，效率低。所以，用 ag 替换默认搜索功能。ag 是一轻量级搜索工具，速度非常快。为集成 ag，添加配置
" 注意：因为定义了 g:ctrlp_user_command 所以上面定义的忽略失效，在 ag 命令上加 --ignore
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor
  " Use ag in CtrlP for listing files.
  let g:ctrlp_user_command = 'ag %s -l --ignore "software/" --nocolor -g ""'
  " Ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" ansible yaml support
Plugin 'chase/vim-ansible-yaml'

" PowerLine 插件，状态栏增强展示
Bundle 'Lokaltog/vim-powerline'
" vim 有一个状态栏，加 powline 则有两状态栏
set laststatus=2
" 指定配色方案为 256 色
" set t_Co=256
let g:Powline_symbols='fancy'
set statusline+=%{fugitive#statusline()} "  Git Hotness

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

" Use the OS clipboard by default (on versions compiled with `+clipboard`)
" set clipboard=unnamed " for mac osx
" set clipboard=unnamedplus " for ubuntu

" Enhance command-line completion（vim 自身命令行模式智能补全）
set wildmenu

" Allow cursor keys in insert mode
set esckeys

" Allow backspace in insert mode
set backspace=indent,eol,start

" Optimize for fast terminal connections
set ttyfast

" Add the g flag to search/replace by default
" :%s/d/c/gc 不再需要加 g，加 g 反而为 searchFirst
" set gdefault

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
" Clear search highlight by hitting enter
nnoremap <silent> <CR> :noh<CR>

" Ignore case of searches
set ignorecase

" Highlight dynamically as pattern is typed（搜索时大小写不敏感）
set incsearch

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

" ??
au FileType html setl sw=2 sts=2 et
au FileType css setl sw=2 sts=2 et

au BufNewFile,BufRead *.conf.j2 set filetype=dosini
au BufNewFile,BufRead *.conf    set filetype=dosini
au BufNewFile,BufRead *.json    set filetype=javascript
au BufNewFile,BufRead *.less    set filetype=css
au BufNewFile,BufRead *.md      set filetype=markdown
au BufNewFile,BufRead .aliases  set filetype=sh

" to bottom if log
au BufNewFile,BufRead *.log normal G

" 设置 markdown 格式自动换行
autocmd FileType markdown set wrap

" basic keymapping
noremap <leader>c :! compass compile<CR>

" open help in new tab
cabbrev help tab help

" web page
noremap <leader>gh :! google-chrome https://github.com<CR>

" 选中文本块复制至系统剪贴板
vnoremap <Leader>y "+y
" 系统剪贴板内容粘贴至 vim
nmap <Leader>p "+p
vmap <C-x> "+c

" Reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv

" 跳转至右方窗口
nnoremap <Leader>wl <C-W>l
" 跳转至左方窗口
nnoremap <Leader>wh <C-W>h
" 跳转至上方窗口
nnoremap <Leader>wk <C-W>k
" 跳转至下方窗口
nnoremap <Leader>wj <C-W>j

" tab 快捷键
nnoremap <Leader>tn :tabnext<cr>
nnoremap <Leader>tp :tabprevious<cr>
nnoremap <Leader>td :tabnew .<cr>
nnoremap <Leader>te :tabedit
nnoremap <Leader>tc :tabclose<cr>

" 设置 markdown filetype
nnoremap <leader>md :set filetype=markdown<CR>

" 将 pathogen 自身也置于独立目录，指定其路径
" runtime bundle/vim-pathogen-2.3/autoload/pathogen.vim
" 运行 pathogen
" execute pathogen#infect()

" no wrapping by default. Use `:set wrap` to re-enable
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

" 调用 astyle 格式化代码，和 F3 有啥区别？
func FormartSrc()
  exec "w"
  if &filetype == 'c'
    exec "!astyle --style=ansi -a --suffix=none %"
  elseif &filetype == 'cpp' || &filetype == 'hpp'
    exec "r !astyle --style=ansi --one-line=keep-statements -a --suffix=none %> /dev/null 2>&1"
  elseif &filetype == 'perl'
    exec "!astyle --style=gnu --suffix=none %"
  elseif &filetype == 'py'||&filetype == 'python'
    exec "r !autopep8 -i --aggressive %"
  elseif &filetype == 'java'
    exec "!astyle --style=java --suffix=none %"
  elseif &filetype == 'jsp'
    exec "!astyle --style=gnu --suffix=none %"
  elseif &filetype == 'xml'
    exec "!astyle --style=gnu --suffix=none %"
  else
    exec "normal gg=G"
    return
  endif
  exec "e! %"
endfunc
map <F6> :call FormartSrc()<CR><CR>

" 新建 .c, .h, .sh, .java，自动插入文件头 
func SetFileHeaderPart() 
    "如果文件类型为.sh文件 
    if &filetype == 'sh' 
        call setline(1,"\#!/bin/bash") 
        call append(line("."), "") 
    elseif &filetype == 'python'
        call setline(1,"#!/usr/bin/env python")
        call append(line("."),"# coding=utf-8")
        call append(line(".")+1, "") 

    elseif &filetype == 'ruby'
        call setline(1,"#!/usr/bin/env ruby")
        call append(line("."),"# encoding: utf-8")
        call append(line(".")+1, "")
    else 
        call setline(1, "/*************************************************************************") 
        call append(line("."),   "  > File Name   : ".expand("%")) 
        call append(line(".")+1, "  > Author      : yuzx2008") 
        call append(line(".")+2, "  > Mail        : yuzx2008@xx.com") 
        call append(line(".")+3, "  > Created Time: ".strftime("%c")) 
        call append(line(".")+4, " ************************************************************************/") 
        call append(line(".")+5, "")
    endif
    if expand("%:e") == 'cpp'
        call append(line(".")+6, "#include<iostream>")
        call append(line(".")+7, "using namespace std;")
        call append(line(".")+8, "")
    endif
    if &filetype == 'c'
        call append(line(".")+6, "#include<stdio.h>")
        call append(line(".")+7, "")
    endif
    if expand("%:e") == 'h'
        call append(line(".")+6, "#ifndef _".toupper(expand("%:r"))."_H")
        call append(line(".")+7, "#define _".toupper(expand("%:r"))."_H")
        call append(line(".")+8, "#endif")
    endif
    if &filetype == 'java'
        call append(line(".")+6,"public class ".expand("%:r"))
        call append(line(".")+7,"")
    endif
endfunc 

autocmd BufNewFile *.cpp,*.[ch],*.sh,*.rb,*.java,*.py exec ":call SetFileHeaderPart()" 
" 新建文件后，自动定位到文件末尾
autocmd BufNewFile * normal G

" ??
set ttimeoutlen=150

" 退出插入模式
autocmd InsertLeave * call Fcitx2En()
" 进入插入模式
"autocmd InsertEnter * call Fcitx2Zh()

" Paste toggle - when pasting something in, don't indent.
set pastetoggle=<F4>

" Python 设置，如：不要 tab 等，.editconfig
" autocmd FileType python set tabstop=4 shiftwidth=4 expandtab
autocmd FileType python map <F12> :!python %<CR>

" 在 bash 中执行光标所在行
nnoremap <leader>b :.w !bash<CR>

