-- require('util/au2').group('PackerGroup', function(grp)
--     grp.BufWritePost = { 'plugins.lua', 'source <afile> | PackerCompile' }
-- end)

return require('packer').startup(function()
  use {'wbthomason/packer.nvim'}

  use {"ellisonleao/gruvbox.nvim", requires = {"rktjmp/lush.nvim"}}
  --use {'morhetz/gruvbox'}
  use {'sainnhe/edge'}
  use {"sainnhe/gruvbox-material"}
  use {'mhartington/oceanic-next'}

  use {'nvim-telescope/telescope.nvim',	requires = { 'nvim-lua/plenary.nvim' }}
  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use {'nvim-treesitter/playground'}

  use {'hoob3rt/lualine.nvim', requires = {'kyazdani42/nvim-web-devicons', opt = true}}
	
  use {'tpope/vim-commentary'}	-- gc
  use {'wellle/targets.vim'}  -- daa cia g> g< gs

  use {'neovim/nvim-lspconfig'}
  use {'qpkorr/vim-bufkill'}	-- :BD

  use {'kyazdani42/nvim-tree.lua', requires = 'kyazdani42/nvim-web-devicons'}

  use {'akinsho/bufferline.nvim', requires = 'kyazdani42/nvim-web-devicons'}

  use {'folke/trouble.nvim', requires = 'kyazdani42/nvim-web-devicons'}

  use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
  use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
  use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
  use 'L3MON4D3/LuaSnip' -- Snippets plugin

  use 'ray-x/lsp_signature.nvim'

  require('util/packerinstall').install() -- install packer if not installed
end)
