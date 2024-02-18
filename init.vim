call plug#begin('~/.config/nvim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'sheerun/vim-polyglot'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'BurntSushi/ripgrep'
Plug 'sharkdp/fd'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.5' }
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
Plug 'chrisbra/csv.vim'
Plug 'HerringtonDarkholme/yats.vim'  
Plug 'fatih/vim-go'
Plug 'kchmck/vim-coffee-script'
Plug 'leafgarland/typescript-vim'
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
Plug 'ryanoasis/vim-devicons'
call plug#end()

set termguicolors
set nocompatible
set showmatch
set ignorecase
set mouse=a
set hlsearch
set autoindent
set number
set wildmode=longest,list
set cc=80
filetype plugin indent on
set tabstop=2
set expandtab
set shiftwidth=2
set softtabstop=2
set cursorline
set noswapfile
set backupdir=~/.cache/vim
set splitbelow splitright
set title
set autoread
set autowrite
colorscheme catppuccin-mocha
syntax on

let g:airline_theme='catppuccin'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

nnoremap <C-q> :q!<CR>
nnoremap <F4> :bd<CR>
nnoremap <F6> :sp<CR>:terminal<CR>
nnoremap <S-Tab> gT
nnoremap <Tab> gt
nnoremap <silent> <S-t> :tabnew<CR>
nnoremap <C-p> :Telescope find_files<CR>
nnoremap <C-o> :Telescope live_grep<CR>
nnoremap <C-b> :Telescope buffers<CR>
