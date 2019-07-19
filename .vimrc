" be iMproved, required
set nocompatible

" required
filetype off

" 设置快捷键前缀，即：<Leader>
let mapleader=","

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" :Matrix
" Plug 'uguu-org/vim-matrix-screensaver'

" Plug 'yonchu/accelerated-smooth-scroll'

" On-demand loading
" Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'scrooloose/nerdtree'
" Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") && !has('gui_running') | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
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

" Using a non-master branch
" Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
Plug 'fatih/vim-go', { 'tag': '*' }

" vim-colors-solarized
Plug 'altercation/vim-colors-solarized'

" :IndentGuidesEnable :IndentGuidesDisable :IndentGuidesToggle
" let g:indent_guides_enable_on_vim_startup = 1
Plug 'nathanaelkane/vim-indent-guides'

Plug 'jiangmiao/auto-pairs'

Plug 'Chiel92/vim-autoformat'
let g:formatdef_my_cpp = '"astyle --style=attach --pad-oper --lineend=linux"'
let g:formatters_cpp = ['my_cpp']
au BufWrite *.cpp,*.cxx,*.c,*.h,*.hpp :Autoformat
noremap <F3> :Autoformat<CR><CR>

" all lanugage support
Plug 'sheerun/vim-polyglot'

" http://editorconfig.org/ && ~/.editorconfig
Plug 'editorconfig/editorconfig-vim'

" %f 文件
" %l 行
" %c 列
" %m 匹配行的文本
set grepformat=%f:%l:%c:%m

Plug 'ctrlpvim/ctrlp.vim'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.png,*.jpg,*.jpeg,*.gif " MacOSX/Linux
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  let g:ctrlp_use_caching = 0
endif

Plug 'dkprice/vim-easygrep'

" vim 有一个状态栏，加 powline 则有两状态栏
set laststatus=2
" 开启 256 色支持，t_Co 即 Terminal Color
if !has('gui_running')
  set t_Co=256
endif
" let g:lightline = {
"       \ 'colorscheme': 'wombat'
"       \ }
Plug 'itchyny/lightline.vim'

Plug 'tyru/open-browser.vim'
Plug 'previm/previm'

" Supertab is a vim plugin which allows you to use <Tab> for all your insert completion needs (:help ins-completion).
Plug 'ervandew/supertab'

Plug 'majutsushi/tagbar'
" Add support for markdown files in tagbar.
let g:tagbar_type_markdown = {
    \ 'ctagstype': 'markdown',
    \ 'ctagsbin' : '~/.vim/markdown2ctags.py',
    \ 'ctagsargs' : '-f - --sort=yes --sro=»',
    \ 'kinds' : [
        \ 's:sections',
        \ 'i:images'
    \ ],
    \ 'sro' : '»',
    \ 'kind2scope' : {
        \ 's' : 'section',
    \ },
    \ 'sort': 0,
\ }

let g:tagbar_type_go = {
 \ 'ctagstype' : 'go',
 \ 'kinds'     : [
  \ 'p:package',
  \ 'i:imports:1',
  \ 'c:constants',
  \ 'v:variables',
  \ 't:types',
  \ 'n:interfaces',
  \ 'w:fields',
  \ 'e:embedded',
  \ 'm:methods',
  \ 'r:constructor',
  \ 'f:functions'
 \ ],
 \ 'sro' : '.',
 \ 'kind2scope' : {
  \ 't' : 'ctype',
  \ 'n' : 'ntype'
 \ },
 \ 'scope2kind' : {
  \ 'ctype' : 't',
  \ 'ntype' : 'n'
 \ },
 \ 'ctagsbin'  : 'gotags',
 \ 'ctagsargs' : '-sort -silent'
\ }


Plug 'scrooloose/nerdcommenter'
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1
" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines = 1

" All of your Plugins must be added before the following line
" Initialize plugin system
call plug#end()

filetype plugin indent on

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
" set binary
set noeol

" Centralize backups, swapfiles and undo history
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
if exists("&undodir")
  set undodir=~/.vim/undo
endif

" Don’t create backups when editing files in certain directories
set backupskip=/tmp/*

" 例如文件中的 /* vim: set expandtab ts=4 sw=4 sts=4 tw=100: */
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
" set cursorcolumn

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
" set mouse=a
set mouse=c

" Disable error bells
set noerrorbells

" Don’t reset cursor to start of line when moving around.
set nostartofline

" Show the cursor position（显示光标位置）
set ruler

" Don’t show the intro message when starting Vim
set shortmess=atI

" Show the current mode
" set showmode
" 因 itchyny/lightline.vim，不再需要显示 mode
set noshowmode

" Show the filename in the window titlebar
set title
if has('title')
  set title titlestring=%F%y%m%r
endif

" Show the (partial) command as it’s being typed（状态栏显示正输入的命令）
set showcmd

" Start scrolling three lines before the horizontal window border
set scrolloff=5

au BufNewFile,BufRead *.conf.j2 set filetype=dosini
au BufNewFile,BufRead *.conf    set filetype=dosini
au BufNewFile,BufRead *.json    set filetype=javascript
au BufNewFile,BufRead *.less    set filetype=css
au BufNewFile,BufRead *.md      set filetype=markdown
au BufNewFile,BufRead .aliases  set filetype=sh

" augroup PrevimSettings
"     autocmd!
"     autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
" augroup END


" to bottom if log
au BufNewFile,BufRead *.log normal G

" 设置 markdown 格式自动换行
autocmd FileType markdown set wrap

" open help in new tab
cabbrev help tab help

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
  " let g:solarized_termcolors=256
endif
colorscheme solarized

" new .c, .h, .sh, .java，自动插入
func SetFileHeaderPart()
    if &filetype == 'sh'
        call setline(1,"\#!/bin/bash")
        call append(line("."), "")
    elseif &filetype == 'python'
        call setline(1,"#!/usr/bin/env python")
        call append(line("."),"# coding=utf-8")
        call append(line(".")+1, "")
    else
        call setline(1, "/*************************************************************************")
        call append(line("."),   "  > File Name   : ".expand("%"))
        call append(line(".")+1, "  > Author      : yuzx")
        call append(line(".")+2, "  > Mail        : yuzx2008@gmail.com")
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

" help ttimeoutlen
set ttimeoutlen=150

" transparent support ctermfg=252
hi Normal ctermbg=none

if exists('$TMUX')
  set term=screen-256color
endif

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
" 退出插入模式
autocmd InsertLeave * call Fcitx2En()
" 进入插入模式
"autocmd InsertEnter * call Fcitx2Zh()

" Paste toggle - when pasting something in, don't indent.
set pastetoggle=<F4>

" Python 设置，如：不要 tab 等，.editconfig
autocmd FileType python set tabstop=4 shiftwidth=4 expandtab
autocmd FileType python map <F12> :!python %<CR>

map <F9> :NERDTreeToggle<CR>
imap <F9> <ESC>:NERDTreeToggle<CR>

" 在 bash 中执行光标所在行
nnoremap <leader>b :.w !bash<CR>

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

vnoremap <Leader>y "+y
map <Leader>p "+p
" 方便多处替换
vmap <Leader>v "0p

" Reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv

" 跳转至右方窗口
" nnoremap <Leader>wl <C-W>l
" nnoremap <Leader>wh <C-W>h
" nnoremap <Leader>wk <C-W>k
" nnoremap <Leader>wj <C-W>j

" echo $HOME
set dictionary=$HOME/docs/vim-dict.txt
" 默认使用字典需要 c-x c-k，可以通过下面命令加到默认补全列表中
set complete-=k complete+=k

