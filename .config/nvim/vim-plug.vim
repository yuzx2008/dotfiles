"" ---- vim-plug.vim ----

" source ~/.vim/autoload/plug.vim
" '~/.config/nvim/plugged'
call plug#begin()

Plug 'itchyny/lightline.vim'

" Color Theme
Plug 'altercation/vim-colors-solarized'
" Plug 'tomasr/molokai'
" Plug 'crusoexia/vim-monokai'
" Plug 'dracula/vim', {'as': 'dracula'}
" Plug 'KeitaNakamura/neodark.vim'
" Plug 'srcery-colors/srcery-vim'
" Plug 'drewtempelmeyer/palenight.vim'
" Plug 'rakr/vim-one'
" Plug 'joshdick/onedark.vim'
" Plug 'tomasiser/vim-code-dark'
" Plug 'morhetz/gruvbox'
" Plug 'Rigellute/rigel'
" Plug 'romainl/Apprentice'
" Plug 'chriskempson/base16-vim'
" Plug 'nanotech/jellybeans.vim'

" Language Server
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Searching
Plug 'rking/ag.vim'

" Markdown
Plug 'plasticboy/vim-markdown'

Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
let g:vim_markdown_conceal=0
let g:vim_markdown_conceal_code_blocks=0

" Vue
" Plug 'posva/vim-vue'

" Rust
" Plug 'rust-lang/rust.vim'
" use coc.nvim rust language server for code formatting
" let g:rustfmt_autosave = 1

call plug#end()

