local opt = vim.opt;
local cmd = vim.api.nvim_command;
local g = vim.g

require'plugins'
require'map'

-- tabs
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.smarttab = true

opt.termguicolors = true         	-- 24bit rgb
opt.background = 'dark'

g.gruvbox_material_palette = 'material'
g.gruvbox_material_background = 'hard'
cmd 'colorscheme gruvbox'

opt.mouse = 'a' -- mouse activated
opt.clipboard = 'unnamedplus'
opt.swapfile = false

opt.number = true -- numbered lines
opt.showmatch = true
opt.ignorecase = true
opt.smartcase	= true

-- cmd [[
-- augroup MyColor
--    autocmd!
--    autocmd ColorScheme * highlight SignColumn ctermbg=234 guibg=234
-- augroup END
-- ]]

-- general
opt.showtabline = 2      -- Always show tabline on top
opt.number= true    -- line numbers
opt.relativenumber = true     -- relative line numbers
opt.lazyredraw= true  -- no redraw while executing macros, registers and other commands
opt.hidden = true -- Allow hidden buffers
opt.list= true -- showing tab character
opt.cursorline= true-- highlights the current line
opt.splitbelow= true -- new split window is put below
opt.splitright= true -- new vsplit window is put right
opt.autoread= true -- auto read file if it has not changed in vim
opt.signcolumn= 'yes:1'   -- error/warning gutter
opt.encoding = 'utf8'
opt.fileencoding = 'utf8'
opt.ruler = true
opt.scrolloff = 4

-- filetype plugin indent on
-- syntax on

