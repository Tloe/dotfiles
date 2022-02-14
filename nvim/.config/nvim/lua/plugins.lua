-- require('util/au2').group('PackerGroup', function(grp)
--     grp.BufWritePost = { 'plugins.lua', 'source <afile> | PackerCompile' }
-- end)

return require('packer').startup(function(use)
  use {'wbthomason/packer.nvim'}
  use {"ellisonleao/gruvbox.nvim", requires = {"rktjmp/lush.nvim"}}
  -- use {'sainnhe/edge'}
  -- use {"sainnhe/gruvbox-material"}
  -- use {'mhartington/oceanic-next'}

  use {'qpkorr/vim-bufkill'}	-- :BD
  use {'tpope/vim-commentary'}	-- gc
  use {'wellle/targets.vim'}  -- daa cia g> g< gs

  use {'hoob3rt/lualine.nvim', requires = {'kyazdani42/nvim-web-devicons', opt = true}}
  use {'kyazdani42/nvim-tree.lua', requires = 'kyazdani42/nvim-web-devicons'}
  use {'akinsho/bufferline.nvim', requires = 'kyazdani42/nvim-web-devicons'}

  use {'nvim-telescope/telescope.nvim',	requires = { 'nvim-lua/plenary.nvim' }}

  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use {'nvim-treesitter/playground'}

  use {'neovim/nvim-lspconfig'}


  -- use {'folke/trouble.nvim', requires = 'kyazdani42/nvim-web-devicons'}

  use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
  use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'

  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/vim-vsnip'

  use 'ray-x/lsp_signature.nvim'


  use 'karb94/neoscroll.nvim'

  require('util/packerinstall').install() -- install packer if not installed
end)
