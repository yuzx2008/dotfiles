if has("unix")
  let s:uname = system("uname -s")
  if s:uname == "Darwin"
    " Do Mac stuff here
    " Use 14pt Monaco
    set guifont=Monaco:h14
  else
    set guifont=Courier\ 10\ Pitch\ 10
    cd /home/yuzx/kuaipan
  endif
elseif has('win32') || has('win64')
  set guifont=Consolas:h11
  cd H:\kuaipan
endif

" Better line-height
" set linespace=8


