" Basic Settings
set number
set ruler
set notitle
set autoindent
set belloff=all
set nocompatible
set backspace=indent,eol,start
set whichwrap+=<,>,h,l,[,]
set mouse=a
syntax on
filetype on

" Colorscheme
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=darkgreen guibg=lightgreen
" colorscheme one-dark

" Search settings
set incsearch
set wildmenu
set wildmode=longest,list,full
set hlsearch
set showcmd
set showmode

" Can't remember why these are needed
set timeoutlen=1000
set ttimeoutlen=0

" Disables tar Plugin
let g:loaded_tarPlugin = 1

" Disable Auto comment insertion
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Default Tab Settings (overridden for certain filetypes later)
set tabstop=8
set shiftwidth=4
set softtabstop=4
set expandtab

" :WQ & :Wq commands when forgetting sudo to edit file
" want to add windows 'run as admin' functionality
command W :execute 'silent w !sudo tee % > /dev/null' | :edit!
command Wq :execute ':W' | :q
command WQ :execute ':W' | :q

" Keep clipboard on exit
autocmd VimLeave * call system("xsel -ib", getreg('+'))

" GUI Fonts
if has('gui_running')
  if has('win32') || has('win16')
    " set guifont=Consolas:h16
    set guifont=DejaVu_Sans_Mono:h16:cANSI
  else
    set guifont=DejaVu\ Sans\ Mono\ 16
  endif
endif
set encoding=utf-8

" Auto yank to clipboard
if has('win32') || has('win16') || has('win32unix')
  set clipboard=unnamed
else
  set clipboard=unnamedplus
endif

" FileType expansions (eg. hard tab for .go files)
" Hard tabs (8 spaces view)
autocmd FileType c    setlocal shiftwidth=8 softtabstop=8 noexpandtab
autocmd FileType cpp  setlocal shiftwidth=8 softtabstop=8 noexpandtab
autocmd FileType yacc setlocal shiftwidth=8 softtabstop=8 noexpandtab
autocmd FileType lex  setlocal shiftwidth=8 softtabstop=8 noexpandtab
autocmd FileType go   setlocal shiftwidth=8 softtabstop=8 noexpandtab
autocmd FileType make setlocal shiftwidth=8 softtabstop=8 noexpandtab

" Keybindings below

" Paste without autoindent
set pastetoggle=<F4>

" Toggle tabs & spacing
function ToggleTabs()
  if &expandtab
    if &softtabstop == 4
      set shiftwidth=2
      set softtabstop=2
      set expandtab
      echo 'Tabs = 2 spaces'
    else
      set shiftwidth=8
      set softtabstop=8
      set noexpandtab
      echo 'Tabs = tabs (8 wide)'
    endif
  else
    set shiftwidth=4
    set softtabstop=4
    set expandtab
    echo 'Tabs = 4 spaces'
  endif
endfunction
nmap <F9> mz:execute ToggleTabs()<CR>'z

" Toggle showing whitespace chars
set nolist
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
highlight ExtraWhitespace ctermbg=darkgreen guibg=lightgreen
function ToggleWhitespace()
  if &list
    set nolist
    match none
  else
    set list
    match ExtraWhitespace /\s\+$\| \+\ze\t/
  endif
endfunction
nmap <F8> mz:execute ToggleWhitespace()<CR>'z

" Leader bindings below

" Leader binding
let mapleader=" "

" Split settings
set splitbelow
set splitright
nnoremap <leader>j <C-W><C-J>
nnoremap <leader>k <C-W><C-K>
nnoremap <leader>l <C-W><C-L>
nnoremap <leader>h <C-W><C-H>
