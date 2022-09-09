
" copy visual selection to cache
vnoremap <Leader>y :w! ~/.vim/.lin-vim-enhanced-copy-paste<CR>
" paste cache to cursor
nnoremap <Leader>p :r ~/.vim/.lin-vim-enhanced-copy-paste<CR>

autocmd BufRead,BufNewFile *.hql setlocal filetype=sql
autocmd BufRead,BufNewFile *.md setlocal filetype=markdown
autocmd BufRead,BufNewFile *.hs setlocal filetype=haskell
autocmd BufRead,BufNewFile *Makefile* setlocal filetype=make
autocmd BufRead,BufNewFile *makefile* setlocal filetype=make
autocmd BufRead,BufNewFile *.ll setlocal filetype=llvm
autocmd BufRead,BufNewFile *.scm setlocal filetype=lisp
autocmd BufRead,BufNewFile *.vuejs setlocal filetype=vue
autocmd BufRead,BufNewFile *.vue setlocal filetype=vue

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


autocmd FileType c,cpp,h,hpp setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab smarttab
autocmd FileType html,xml,xhtml,json,js setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab smarttab

" Line length marker=120
" set colorcolumn=120

" let g:coc_global_extensions = ['coc-snippets', 'coc-tag', 'coc-pyright', 'coc-clangd', 'coc-cmake', 'coc-json', 'coc-html', 'coc-xml', 'coc-css', 'coc-tsserver', 'coc-eslint', 'coc-sql', 'coc-prettier', 'coc-emmet', 'coc-vetur', 'coc-rust-analyzer']
