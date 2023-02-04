" be iMproved, required
set nocompatible

" annoying sound on errors
set noerrorbells
set novisualbell
if has("gui_running")
    " gui bell
    autocmd GUIEnter * set vb t_vb=
endif

" required
filetype off

" 设置快捷键前缀，即：<Leader>
let mapleader=","
" 设置快捷键前缀，即：<LocalLeader>
let maplocalleader = ','

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" vim-colors-solarized
" Plug 'altercation/vim-colors-solarized'

" http://editorconfig.org/ && ~/.editorconfig
Plug 'editorconfig/editorconfig-vim'

" %f 文件
" %l 行
" %c 列
" %m 匹配行的文本
set grepformat=%f:%l:%c:%m

" c-f 切换 mru/files/buf
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.png,*.jpg,*.jpeg,*.gif " MacOSX/Linux
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor
  let g:ctrlp_use_caching = 0
  let g:ctrlp_working_path_mode = 'ra'
  " 可 c-p 后 c-r 切换
  let g:ctrlp_regexp = 1
  let g:ctrlp_by_filename = 1
  " let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  let g:ctrlp_user_command = 'ag %s -l --hidden --nocolor -g ""'
endif
Plug 'ctrlpvim/ctrlp.vim'

" 开启 256 色支持，t_Co 即 Terminal Color
if !has('gui_running')
  set t_Co=256
endif

Plug 'itchyny/lightline.vim'

Plug 'tyru/open-browser.vim'
Plug 'yuzx2008/previm'

let g:UltiSnipsUsePythonVersion=3
" snippet 引擎
Plug 'SirVer/ultisnips'
" snippet 代码
Plug 'yuzx2008/vim-snippets'
let g:UltiSnipsSnippetDirectories=['UltiSnips', $HOME.'/.vim/UltiSnips']
let g:UltiSnipsExpandTrigger="<tab>"
" 跳至下个 tab stop
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

" Use release branch (Recommend)
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" rust
" Plug 'rust-lang/rust.vim'

" json filetype=jsonc 允许 json 中包含注释
Plug 'neoclide/jsonc.vim'

Plug 'preservim/tagbar'
nmap <F8> :TagbarToggle<CR>

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

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
let g:go_gopls_options = ["-remote=127.0.0.1:60098", "-logfile=auto", "-debug=:0", "-rpc.trace"]
Plug 'fatih/vim-go'
" 支持 struct 等 split-join
" Plug 'AndrewRadev/splitjoin.vim'
" 代码追踪，gd 自动跳转
Plug 'dgryski/vim-godef'

let g:go_test_timeout = '10s'
let g:go_fmt_autosave = 0
" goimports 比 gofmt 导入 package 更好，大 code base 会慢
let g:go_fmt_command = "goimports"
" 默认 snake_case
" let g:go_addtags_transform = "camelcase"
" let g:go_fmt_fail_silently = 1
let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
" gometalinter 很快
" let g:go_metalinter_autosave = 1
" let g:go_metalinter_autosave_enabled = ['vet', 'golint']
" let g:go_metalinter_deadline = "5s"
" 当光标在标识符上，status line 自动显式 go-info，可设置更新时间 set updatetime=100，默认 800ms
let g:go_auto_type_info = 1
" :GoSameIds 自动
let g:go_auto_sameids = 1
" 'goroutines': 'rightbelow 10new',
let g:go_debug_windows = {
      \ 'vars':       'rightbelow 50vnew',
      \ 'stack':      'rightbelow 10new',
      \ }
" F5 continue
" F9 add breakpoint
" F8 halt
" F10 next
" F11 step in
let g:go_debug_mappings = {
      \ '(go-debug-continue)': {'key': 'c', 'arguments': '<nowait>'},
      \ '(go-debug-next)': {'key': 'n', 'arguments': '<nowait>'},
      \ '(go-debug-step)': {'key': 's'},
      \ '(go-debug-print)': {'key': 'p'},
  \}

map <leader>ds :GoDebugStart<cr>
map <leader>dt :GoDebugStop<cr>
map <leader>db :GoDebugBreakpoint<cr>

" :A!/:AV!/:AH!/:AT!
autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
autocmd Filetype go command! -bang AH call go#alternate#Switch(<bang>0, 'split')
autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')
autocmd FileType go nmap <Leader>i <Plug>(go-info)

" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
autocmd FileType go nmap <leader>t <Plug>(go-test-func)
autocmd FileType go nmap <Leader>co <Plug>(go-coverage-toggle)
autocmd FileType go nmap <leader>ru <Plug>(go-run)

" All of your Plugins must be added before the following line
" Initialize plugin system
call plug#end()

filetype plugin indent on


" Enhance command-line completion（vim 自身命令行模式智能补全）
set wildmenu

" Add the g flag to search/replace by default
" :%s/d/c/gc 不再需要加 g，加 g 反而为 searchFirst
" set gdefault


" Clear search highlight by hitting enter
nnoremap <silent> <CR> :noh<CR>

" Ignore case of searches
set ignorecase

" Highlight dynamically as pattern is typed（搜索时大小写不敏感）
set incsearch

" Don’t reset cursor to start of line when moving around.
set nostartofline

"" file writing

" 检测文件已经变化自动加载
set autoread
" 执行 make/GoBuild 时，自动保存
set autowrite
" Show the cursor position（显示光标位置）
set ruler
" 检索时 $ . * ^ [ ] 这几个字符不需要 \ 转义
set magic
" 匹配模式，输入左括号匹配右括号
set showmatch
" Don’t add empty newlines at the end of files
set noeol
" for coc.nvim: Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup
" set noswapfile
" set noundofile
" Centralize backups, swapfiles and undo history
" set backupdir=~/.vim/backups
" Don’t create backups when editing files in certain directories
" set backupskip=/tmp/*
set directory=~/.vim/swaps
if exists("&undodir")
  set undodir=~/.vim/undo
endif

" new .c, .h, .sh, .java，自动插入
func SetFileHeaderPart()
  if &filetype == 'sh'
    call setline(1,"\#!/usr/bin/env bash")
    call setline(2,"set -o pipefail")
    call setline(3,"set -x")
    call append(line("."), "")
  endif
endfunc

" Don’t show the intro message when starting Vim
set shortmess=atI

"" encoding

" Use UTF-8 without BOM
set encoding=utf-8 nobomb
set fileencoding=utf-8
set termencoding=utf-8
" 自动判断文件编码时，依次尝试
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1,gbk
" set fileformat=unix
" set fileformats=unix,dos,mac

"" mouse

" Enable mouse in all modes（Vim 可鼠标，防止终端下无法拷贝）
" set mouse=a
set mouse=c

"" indent

" 设置 C/C++ 自动对齐
" set autoindent
" set cindent
" set smartindent
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

"" display

" Show the (partial) command as it’s being typed（状态栏显示正输入的命令）
set showcmd
" Highlight searches（高亮搜索结果）
set hlsearch
" Allow backspace in insert mode
set backspace=indent,eol,start whichwrap+=<,>,[,]

" no wrapping by default. Use `:set wrap` to re-enable
set nowrap
" set wrap

" Use the OS clipboard by default (on versions compiled with `+clipboard`)
" set clipboard=unnamed " for mac osx
" set clipboard=unnamedplus " for ubuntu

" Show “invisible” characters
set listchars=tab:▸\ ,trail:·,eol:¬,nbsp:_
" set listchars=tab:>-,trail:~,extends:>,precedes:<

" set list

"" color

" light dark
if has('gui_running')
  set background=light
else
  set background=dark
  " let g:solarized_termcolors=256
endif
" colorscheme solarized

" transparent support ctermfg=252
highlight Normal ctermbg=none

" if exists('$TMUX')
"   set term=screen-256color
" endif

" GUI fonts
if has("win32")
    " win32
    set guifont=Hack:h9
elseif has("mac")
    " macos
    set guifont=Hack:h12
else
    " linux, unix
    set guifont=Hack\ 10
endif

"" cursorline

" Start scrolling three lines before the horizontal window border
set scrolloff=5
" Highlight current line（高亮当前行/列）
set nocursorline
set nocursorcolumn
" Line length marker=120
" set colorcolumn=120
" Enable line numbers（行号）
" set number
" vim 有一个状态栏，加 powline 则两状态栏
set laststatus=2
set lazyredraw
" Optimize for fast terminal connections
set ttyfast
" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Show the current mode
" set showmode
" 因 itchyny/lightline.vim，不再需要显示 mode
set noshowmode

" Show the filename in the window titlebar
set title
if has('title')
  set title titlestring=%F%y%m%r
endif

" timeoutlen is used for mapping delays
" ttimeoutlen is used for key code delays
" set timeoutlen=1000 ttimeoutlen=0
set ttimeoutlen=50

" :help :highlight-link
highlight link markdownItalic NONE
highlight link markdownBoldItalic NONE
highlight link markdownBoldItalicDelimiter NONE

" Set cursor shape and color
" INSERT mode
let &t_SI = "\<Esc>[1 q" . "\<Esc>]12;green\x7"
" REPLACE mode
let &t_SR = "\<Esc>[1 q" . "\<Esc>]12;green\x7"
" NORMAL mode
" https://www.ditig.com/256-colors-cheat-sheet
let &t_EI = "\<Esc>[2 q" . "\<Esc>]12;rgb:9E/9E/9E\x7"
" 1 -> blinking block  闪烁的方块
" 2 -> solid block  不闪烁的方块
" 3 -> blinking underscore  闪烁的下划线
" 4 -> solid underscore  不闪烁的下划线
" 5 -> blinking vertical bar  闪烁的竖线
" 6 -> solid vertical bar  不闪烁的竖线

" open help in new tab
cabbrev help tab help

" 配色方案
syntax enable
" Enable syntax highlighting
syntax on

" vimrc 修改后立刻生效，不用重新打开
" autocmd BufWritePost $MYVIMRC source $MYVIMRC

autocmd BufNewFile,BufRead *.conf set filetype=dosini
autocmd BufNewFile,BufRead *.{md,mkd,rmd,mark*}  set filetype=markdown
autocmd BufNewFile,BufRead .aliases set filetype=sh
" to bottom if log
autocmd BufNewFile,BufRead *.log normal G
" markdown 自动换行
autocmd FileType markdown set wrap
" autocmd FileType markdown %retab! 2
" autocmd FileType yaml %retab! 2
" autocmd FileType ruby autocmd BufWrite <buffer> RuboCop -a
" :h autocommand-pattern
autocmd BufWritePre * set nopaste
autocmd BufWritePre *.md,*.yml,*.yaml %retab! 2
autocmd BufNewFile *.cpp,*.[ch],*.sh,*.java,*.py exec ":call SetFileHeaderPart()"
" 新建文件自动定位文件尾
autocmd BufNewFile * normal G
" Python 设置，如：不要 tab 等，.editconfig
autocmd FileType python set tabstop=4 shiftwidth=4 expandtab
autocmd FileType python map <F12> :!python %<CR>
autocmd BufRead,BufNewFile *Makefile* setlocal filetype=make
autocmd BufRead,BufNewFile *makefile* setlocal filetype=make
autocmd FileType c,cpp,h,hpp setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab smarttab
autocmd FileType html,xml,xhtml,json,js setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab smarttab
" 退出插入模式指定类型文件自动保存
" autocmd InsertLeave *.go,*.sh,*.md write

" go
" autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=2 shiftwidth=2

" YAML 设置，支持 .yml .yaml
" ai = auto indent，自动退格对齐
" set tabstop=2，一个 tab 2 个空格宽
" set shiftwidth=2，退格对齐以 2 空格为准
" set expandtab tab 变空格
" autocmd FileType yaml setlocal ai ts=2 sw=2 et
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

if exists('$TMUX')
  set term=screen-256color
endif

if !exists("g:os")
  if has("win64") || has("win32")
    let g:os = "Windows"
  else
    let g:os = substitute(system('uname'), '\n', '', '')
  endif
endif

" fcitx 退出插入模式，切换英文输入
function! Fcitx2En()
  if g:os == "Darwin"
    let s:input_status = system("im-select")
    if s:input_status != "com.apple.keylayout.ABC"
      let l:a = system("im-select com.apple.keylayout.ABC")
    endif
  elseif g:os == "Linux"
    let s:input_status = system("fcitx5-remote")
    if s:input_status == 2
      let l:a = system("fcitx5-remote -c")
    endif
  endif
endfunction
function! Fcitx2Zh()
  if g:os == "Darwin"
    let s:input_status = system("im-select")
    if s:input_status != "com.apple.keylayout.ABC"
      let l:a = system("im-select com.sogou.inputmethod.sogou.pinyin")
    endif
  elseif g:os == "Linux"
    let s:input_status = system("fcitx5-remote")
    if s:input_status != 2
      let l:a = system("fcitx5-remote -o")
    endif
  endif
endfunction
" 退出插入模式
autocmd InsertLeave * call Fcitx2En()
" 进入插入模式
" autocmd InsertEnter * call Fcitx2Zh()

"" key mapping

" Paste toggle - when pasting something in, don't indent.
set pastetoggle=<F4>

map <F9> :NERDTreeToggle<CR>
imap <F9> <ESC>:NERDTreeToggle<CR>

" 在 bash 中执行光标所在行
" GoGuild
" nnoremap <leader>b :.w !bash<CR>

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
" noremap <leader>W :w !sudo tee % > /dev/null<CR>
cmap W! silent w !sudo tee % >/dev/null

vnoremap <Leader>y "+y
map <Leader>p "+p
" 方便多处替换
map <Leader>v "0p

" Reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv

" map <Esc>[13;5u <C-CR>
" ~/.vim/plugged/Nvim-R/R/common_global.vim
" nnoremap <C-CR> :call SendLineToR("down")<CR>
" xnoremap <C-CR> :call SendSelectionToR("echo", "down", "normal")<CR>
" inoremap <C-CR> <ESC>:call SendLineToR("down")<CR>
" autocmd VimLeave * if exists("g:SendCmdToR") && string(g:SendCmdToR) != "function('SendCmdToR_fake')" | call RQuit("nosave") | endif
" autocmd QuitPre * if exists("g:SendCmdToR") | call RQuit("nosave") | endif

" let g:coc_global_extensions = ['coc-snippets', 'coc-tag', 'coc-pyright', 'coc-json', 'coc-html', 'coc-xml', 'coc-css', 'coc-tsserver', 'coc-eslint', 'coc-sql', 'coc-prettier', 'coc-emmet', 'coc-vetur', 'coc-rust-analyzer']

"" coc.nvim

" TextEdit might fail if hidden is not set.
set hidden

" Give more space for displaying messages.
set cmdheight=1

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: There's always complete item selected by default, you may want to enable no select by `"suggest.noselect": true` in your configuration file.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
" :h map-special-chars
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Run the Code Lens action on the current line.
nmap <leader>cl  <Plug>(coc-codelens-action)


" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocActionAsync('format')
nmap <F3> :call CocActionAsync('format')<CR>

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
" explorer
nnoremap <silent><nowait> <space>x  :<C-u>CocCommand explorer<cr>
