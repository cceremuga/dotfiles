" specify directory for plugins
call plug#begin('~/.config/nvim/plugged')

" general
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'sheerun/vim-polyglot'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'BurntSushi/ripgrep'
Plug 'sharkdp/fd'
Plug 'nvim-telescope/telescope.nvim',
Plug 'stevearc/conform.nvim'

" themes
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }

" language
Plug 'chrisbra/csv.vim'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'fatih/vim-go'
Plug 'kchmck/vim-coffee-script'
Plug 'mxw/vim-jsx'

" icons
Plug 'ryanoasis/vim-devicons'

" initialize plugin system
call plug#end()

" basic settings
set termguicolors
set nocompatible            " disable compatibility to old-time vi
set showmatch               " show matching brackets.
set ignorecase              " case insensitive matching
set mouse=a                 " enable mouse
set hlsearch                " highlight search results
set autoindent              " indent a new line the same amount as the line just typed
set number                  " add line numbers
set wildmode=longest,list   " get bash-like tab completions
set cc=80                   " set colour columns for good coding style
filetype plugin indent on   " allows auto-indenting depending on file type
set tabstop=2               " number of columns occupied by a tab character
set expandtab               " convert tabs to white space
set shiftwidth=2            " width for autoindents
set softtabstop=2           " see multiple spaces as tabstops so <BS> does the right thing
set cursorline
set noswapfile
set backupdir=~/.cache/vim
set splitbelow splitright
set title
set autoread
set autowrite

colorscheme catppuccin-mocha
syntax on

" airline
let g:airline_theme='catppuccin'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" keyboard shortcuts
nnoremap <C-q> :q!<CR>
nnoremap <F4> :bd<CR>
nnoremap <F6> :sp<CR>:terminal<CR>
nnoremap <S-Tab> gT
nnoremap <Tab> gt
nnoremap <silent> <S-t> :tabnew<CR>
nnoremap <C-p> :Telescope find_files<CR>
nnoremap <C-o> :Telescope live_grep<CR>
nnoremap <C-b> :Telescope buffers<CR>
