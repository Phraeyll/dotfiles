syntax on
set nocompatible
set backspace=indent,eol,start
set number
set ruler
set incsearch
set wildmenu
set wildmode=longest,list,full
set hlsearch
set showcmd
set autoindent
set mouse=a
set pastetoggle=<F4>
set clipboard=unnamedplus
set nobackup
set noswapfile
autocmd VimLeave * call system("xsel -ib", getreg('+'))

colorscheme delek

command W :execute 'silent w !sudo tee % > /dev/null' | :edit!
command Wq :execute ':W' | :q
command WQ :execute ':W' | :q

" set whichwrap+=<,>h,l,[,]
" set softtabstop=2
" set shiftwidth=2
" set expandtab

let g:loaded_tarPlugin = 1
