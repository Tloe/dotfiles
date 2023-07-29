return require('packer').startup(function(use)
  use { 'wbthomason/packer.nvim' }

  use { "ellisonleao/gruvbox.nvim", requires = { "rktjmp/lush.nvim" } }
  -- use { "https://github.com/mcchrish/zenbones.nvim", requires = "rktjmp/lush.nvim" }
  -- use 'shaunsingh/nord.nvim'
  -- use {'sainnhe/edge'}
  -- use {"sainnhe/gruvbox-material"}
  -- use {'mhartington/oceanic-next'}

  use { 'qpkorr/vim-bufkill' } -- :BD
  -- use { 'tpope/vim-commentary' } -- gc
  use { 'terrortylor/nvim-comment' }
  use { 'wellle/targets.vim' } -- daa cia g> g< gs

  use { 'hoob3rt/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons', opt = true } }
  use { 'kyazdani42/nvim-tree.lua', requires = 'kyazdani42/nvim-web-devicons' }

  use { 'nvim-telescope/telescope.nvim', requires = { 'nvim-lua/plenary.nvim' } }

  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  -- use { 'nvim-treesitter/playground' }
  use { 'nvim-treesitter/nvim-treesitter-textobjects' }
  use { 'neovim/nvim-lspconfig' }
  use { 'williamboman/mason.nvim' } -- installs lsp servers
  use { 'williamboman/mason-lspconfig.nvim' }
  use 'ray-x/lsp_signature.nvim' -- show function signature

  use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
  use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/vim-vsnip'
  use 'folke/trouble.nvim'

  use 'neomake/neomake'
  use 'https://git.sr.ht/~b6d/nvim-platformio'

  use 'mg979/vim-visual-multi'

  use { 'mfussenegger/nvim-dap',
    config = function()
      require("config.dap").setup()
    end,
  }
  use 'leoluz/nvim-dap-go'
  use { "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } }

  use 'karb94/neoscroll.nvim'

  use 'ggandor/lightspeed.nvim'

  use 'PeterRincker/vim-argumentative'

  use 'normen/vim-pio'

  use 'ErichDonGubler/lsp_lines.nvim'

  -- use 'ranjithshegde/ccls.nvim'
  use 'thosakwe/vim-flutter'

  use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install",
    setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, })

  require('util/packerinstall').install() -- install packer if not installed
end)
