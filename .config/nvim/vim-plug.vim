"" ---- vim-plug.vim ----

" source ~/.vim/autoload/plug.vim
" '~/.config/nvim/plugged'
call plug#begin()

" UI
Plug 'Yggdroot/indentLine'
Plug 'scrooloose/nerdtree'
Plug 'majutsushi/tagbar'
Plug 'itchyny/lightline.vim'
Plug 'ap/vim-buftabline'

" Color Theme
Plug 'altercation/vim-colors-solarized'
Plug 'tomasr/molokai'
Plug 'crusoexia/vim-monokai'
Plug 'dracula/vim', {'as': 'dracula'}
Plug 'KeitaNakamura/neodark.vim'
Plug 'srcery-colors/srcery-vim'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'rakr/vim-one'
Plug 'joshdick/onedark.vim'
Plug 'tomasiser/vim-code-dark'
Plug 'morhetz/gruvbox'
Plug 'Rigellute/rigel'
Plug 'romainl/Apprentice'
Plug 'chriskempson/base16-vim'
Plug 'nanotech/jellybeans.vim'

" Language Server
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'ludovicchabant/vim-gutentags'
" Plug 'sheerun/vim-polyglot'

" Comment
" Plug 'tpope/vim-commentary'
Plug 'preservim/nerdcommenter'

" Git
Plug 'mhinz/vim-signify'

" Searching
Plug 'jremmen/vim-ripgrep'
Plug 'rking/ag.vim'
Plug 'Yggdroot/LeaderF'

" Keyboard Operation
Plug 'tpope/vim-repeat'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-surround'
Plug 'haya14busa/incsearch.vim'
Plug 'junegunn/vim-easy-align'
Plug 'jiangmiao/auto-pairs'

" HTML, XML tag
Plug 'andymass/vim-matchup'
Plug 'alvan/vim-closetag'

" Markdown
Plug 'plasticboy/vim-markdown'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }

" Vue
Plug 'posva/vim-vue'

" Rust
Plug 'rust-lang/rust.vim'

call plug#end()
