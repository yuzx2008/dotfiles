
" from https://github.com/linrongbin16/lin.vim.git

" 1) vim plugins
source ~/.config/nvim/vim-plug.vim

" 2) standalone config
source ~/.config/nvim/lin-vim-standalone.vim

" 3) vim-plug config

" UI
source ~/.config/nvim/lin-vim-colorscheme.vim
source ~/.config/nvim/Yggdroot-indentLine.vim
source ~/.config/nvim/scrooloose-nerdtree.vim
source ~/.config/nvim/itchyny-lightline.vim
source ~/.config/nvim/majutsushi-tagbar.vim

" Syntax highlight
source ~/.config/nvim/sheerun-vim-polyglot.vim

" Language
source ~/.config/nvim/neoclide-coc.nvim.vim
source ~/.config/nvim/ludovicchabant-vim-gutentags.vim
source ~/.config/nvim/rust-lang-rust.vim

" Comment
source ~/.config/nvim/preservim-nerdcommenter.vim

" Search
source ~/.config/nvim/jremmen-vim-ripgrep.vim
source ~/.config/nvim/Yggdroot-LeaderF.vim

" Keyboard Operation
source ~/.config/nvim/easymotion-vim-easymotion.vim
source ~/.config/nvim/haya14busa-incsearch.vim
source ~/.config/nvim/junegunn-vim-easy-align.vim

" HTML/XML
source ~/.config/nvim/alvan-vim-closetag.vim

" Markdown
source ~/.config/nvim/plasticboy-vim-markdown.vim

" 4) user setting
if filereadable(expand('~/.config/nvim/user-settings.vim'))
	source ~/.config/nvim/user-settings.vim
endif

