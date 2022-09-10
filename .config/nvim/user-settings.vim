
autocmd BufRead,BufNewFile *.md setlocal filetype=markdown
autocmd BufRead,BufNewFile *Makefile* setlocal filetype=make
autocmd BufRead,BufNewFile *makefile* setlocal filetype=make

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

" let g:coc_global_extensions = ['coc-snippets', 'coc-tag', 'coc-pyright', 'coc-json', 'coc-html', 'coc-xml', 'coc-css', 'coc-tsserver', 'coc-eslint', 'coc-sql', 'coc-prettier', 'coc-emmet', 'coc-vetur', 'coc-rust-analyzer']
