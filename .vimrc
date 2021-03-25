syntax on
set rnu
set number
set hlsearch
set history=1000
set so=7
set wildmenu
set ruler
set smartcase
set incsearch
set showmatch
set noerrorbells
set noswapfile
set expandtab
set smarttab
set shiftwidth=4
set tabstop=4
set ai
set si
highlight Comment ctermfg=green

""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Function: display errors from Ale in statusline
set laststatus=2
set statusline+=\ ‹‹
set statusline+=\ %f\ %*
set statusline+=\ ››
set statusline+=\ %m
set statusline+=%#keyword#\ %F
set statusline+=%=

" Enable filetype plugins
filetype plugin on
filetype indent on

