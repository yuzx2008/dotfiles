if has("unix")
  let s:uname = system("uname -s")
  if s:uname == "Darwin"
    " Do Mac stuff here
    " Use 14pt Monaco
    set guifont=Monaco:h14
  else
    " Courier\ 10\ Pitch\ 10
    set guifont=DejaVu\ Sans\ Mono\ 9
    cd $HOME/docs
  endif
elseif has('win32') || has('win64')
  set guifont=Consolas:h11
  cd H:\kuaipan
endif

" Better line-height
" set linespace=8
set guioptions-=r
set guioptions-=l
set guioptions-=R
set guioptions-=L
set guioptions-=b
set guioptions-=T

