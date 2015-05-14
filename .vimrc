" Basic Settings
syntax on
colorscheme delek
set nocompatible
set number
set ruler
set title
set backspace=indent,eol,start
set incsearch
set wildmenu
set wildmode=longest,list,full
set hlsearch
set showcmd
set showmode
set autoindent
set mouse=a
set whichwrap+=<,>h,l,[,]

" GUI Fonts
if has ('gui_running')
  if has ('win32') || has ('win16')
    set guifont=Consolas:h12
  else
    set guifont=DejaVu Sans Mono:h12
  endif
endif
" Disable temp backup & swap files
set nobackup
set noswapfile

" Auto yank to clipboard
if has ('win32') || has ('win16') || has('win32unix')
  set clipboard=unnamed
else
  set clipboard=unnamedplus
endif
" Keep clipboard on exit
autocmd VimLeave * call system("xsel -ib", getreg('+'))
" Paste without autoindent
set pastetoggle=<F4>

" :WQ & :Wq commands when forgetting sudo to edit file
" want to add windows 'run as admin' functionality
command W :execute 'silent w !sudo tee % > /dev/null' | :edit!
command Wq :execute ':W' | :q
command WQ :execute ':W' | :q

" Disables tar Plugin
let g:loaded_tarPlugin = 1

" Tab Settings
set tabstop=8
set shiftwidth=2
set softtabstop=2
set expandtab
" Never expand tabs for makefiles regardless of filename
autocmd FileType make setlocal noexpandtab
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
      set softtabstop=0
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
function ToggleWhitespace()
  if &list
    set nolist
  else
    set list
  endif
endfunction
nmap <F8> mz:execute ToggleWhitespace()<CR>'z
