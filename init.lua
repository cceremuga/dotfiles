vim.cmd([[
  call plug#begin('~/.config/nvim/plugged')

  " General
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'sheerun/vim-polyglot'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-treesitter/nvim-treesitter'
  Plug 'BurntSushi/ripgrep'
  Plug 'sharkdp/fd'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'mason-org/mason.nvim'
  Plug 'stevearc/conform.nvim'

  " Themes
  Plug 'catppuccin/nvim', { 'as': 'catppuccin' }

  " Language support
  Plug 'chrisbra/csv.vim'
  Plug 'HerringtonDarkholme/yats.vim'
  Plug 'fatih/vim-go'
  Plug 'kchmck/vim-coffee-script'
  Plug 'mxw/vim-jsx'

  " Icons
  Plug 'ryanoasis/vim-devicons'

  call plug#end()
]])

-- Options
vim.opt.termguicolors = true
vim.opt.compatible = false
vim.opt.showmatch = true
vim.opt.ignorecase = true
vim.opt.mouse = "a"
vim.opt.hlsearch = true
vim.opt.autoindent = true
vim.wo.number = true
vim.opt.wildmode = { "longest", "list" }
vim.opt.colorcolumn = "80"
vim.cmd([[filetype plugin indent on]])
vim.opt.tabstop = 2
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.wo.cursorline = true
vim.opt.swapfile = false
vim.opt.backupdir = vim.fn.expand("~/.cache/vim")
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.title = true
vim.opt.autoread = true
vim.opt.autowrite = true
vim.cmd([[colorscheme catppuccin-mocha]])
vim.cmd([[syntax on]])

-- Airline
vim.g.airline_theme = "catppuccin"
vim.g.airline_powerline_fonts = 1
vim.g["airline#extensions#tabline#enabled"] = 1

-- Mason
require("mason").setup()

-- Conform
local js_formatters = {
	"prettierd",
	"prettier",
	lsp_format = "fallback",
	stop_after_first = true,
}

require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		javascript = js_formatters,
		javascriptreact = js_formatters,
		typescript = js_formatters,
		typescriptreact = js_formatters,
	},
	format_on_save = {
		timeout_ms = 500,
		lsp_format = "fallback",
	},
})

-- Keyboard Shortcuts
local map = vim.api.nvim_set_keymap
local opts = {
	noremap = true,
	silent = true,
}

map("n", "<C-q>", ":q!<CR>", opts)
map("n", "<F4>", ":bd<CR>", opts)
map("n", "<F6>", ":sp | terminal<CR>", opts)
map("n", "<S-Tab>", "gT", opts)
map("n", "<Tab>", "gt", opts)
map("n", "<S-t>", ":tabnew<CR>", opts)
map("n", "<C-p>", ":Telescope find_files<CR>", opts)
map("n", "<C-o>", ":Telescope live_grep<CR>", opts)
map("n", "<C-b>", ":Telescope buffers<CR>", opts)
map("n", "<C-f>", ":lua require('conform').format()<CR>", opts)
