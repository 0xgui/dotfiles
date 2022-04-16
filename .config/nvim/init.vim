" General.
" Install Vim Plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

set number " Show number of lines
set autoindent " Copy indent from last line when starting new line
set autoread " Set to auto read when a file is changed from the outside
set expandtab " Expand tabs to spaces
set gdefault " By default add g flag to search/replace. Add g to toggle
set hidden " When a buffer is brought to foreground, remember undo history and marks
set history=1000 " Increase history from 20 default to 1000
set hlsearch " Highlight searches
set ignorecase
set incsearch " Highlight dynamically as pattern is typed
set laststatus=2 " Always show status line
set magic " Enable extended regexes
set mouse=a " Enable mouse in all in all modes
set noerrorbells " Disable error bells
set foldlevelstart=99
set noshowmode " Don't show the current mode (airline.vim takes care of us)
set nostartofline " Don't reset cursor to start of line when moving around
set nowrap " Do not wrap lines
set regexpengine=1 " Use the old regular expression engine (it's faster for certain language syntaxes)
set report=0 " Show all changes
set ruler " Show the cursor position
set scrolloff=7 " Start scrolling seven lines before horizontal border of window
set shell=/bin/sh " Use /bin/sh for executing shell commands
set shiftwidth=4 " The # of spaces for indenting
set softtabstop=4
set showtabline=2 " Always show tab bar
set sidescrolloff=3 " Start scrolling three columns before vertical border of window
set smartcase " Ignore 'ignorecase' if search patter contains uppercase characters
set smarttab " At start of line, <Tab> inserts shiftwidth spaces, <Bs> deletes shiftwidth spaces
set splitbelow " New window goes below
set splitright " New windows goes right
set ttyfast " Send more characters at a given time
set undofile " Persistent Undo
set visualbell " Use visual bell instead of audible bell (annnnnoying)
set wildchar=<TAB> " Character for CLI expansion (TAB-completion)
set wildmenu " Hitting TAB in command mode will show possible completions above command line
set winminheight=0 " Allow splits to be reduced to a single line
set wrapscan " Searches wrap around end of file
set clipboard=unnamedplus

"---------------- Plugins-------------------
call plug#begin('~/.local/share/nvim/plugged')
" Visual
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'ryanoasis/vim-devicons' " Icons
Plug 'akinsho/bufferline.nvim', { 'tag': 'v1.1.1' } " Top buffers bar
Plug 'nvim-lualine/lualine.nvim' " Bottom status bar
" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'
"LSP autocomplete
Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}
" Others
Plug 'junegunn/vim-plug' " Auto install vim-plug
Plug 'sheerun/vim-polyglot' " Language packs
Plug 'lewis6991/gitsigns.nvim' " Add gitsigns 
Plug 'jiangmiao/auto-pairs' " Brackets Pairs
Plug 'preservim/nerdtree' " Tree File
Plug 'https://github.com/tpope/vim-commentary' " gcc to comment
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} " Highlight, indenting, folding
Plug 'sindrets/diffview.nvim' " Show git diffview
Plug 'lukas-reineke/lsp-format.nvim'
"Telescope Requirements
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
call plug#end()

" Colors, Fonts, and Syntax.
syntax on
set t_Co=256
set encoding=utf-8
set guifont=Hack

" Directories.
set backupdir=~/.local/share/nvim/backup
set directory=~/.local/share/nvim/swap
set undodir=~/.local/share/nvim/undo

" Keybinds
" map space key as leader
map <Space> <leader>

nnoremap <C-f> :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>

nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fhf <cmd>Telescope find_files hidden=true<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

nnoremap <leader>bn :bnext<CR>
nnoremap <leader>bp :bprevious<CR>
nnoremap <leader>bf :bfirst<CR>
nnoremap <leader>bl :blast<CR>

" will find .lua file that exist at runtime
" should be unique
lua << EOF
require("plugins")
require("_lsp")
require("_coq")
require("_telescope")
require("_treesitter")
require("_lspinstaller")
require("_gitsigns")
require("_tokyo")
require("_lsp-format")

EOF

