return {
  {
    "ellisonleao/gruvbox.nvim",
    dependencies = { "rktjmp/lush.nvim" },
    config = function()
      vim.g.gruvbox_material_palette = 'material'
      vim.g.gruvbox_material_background = 'hard'
      vim.api.nvim_command 'colorscheme gruvbox'
    end,
  },
  { 'qpkorr/vim-bufkill' }, -- :BD
  {
    'terrortylor/nvim-comment',
    config = function()
      require('nvim_comment').setup()
    end,
  },
  { 'wellle/targets.vim' }, -- daa cia g> g< gs
  {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },
  { 'ray-x/lsp_signature.nvim' }, -- show function signature
  { 'folke/trouble.nvim' },
  { 'neomake/neomake' },
  { 'https://git.sr.ht/~b6d/nvim-platformio' },
  { 'mg979/vim-visual-multi' },
  { "nvim-neotest/nvim-nio" },
  { 'karb94/neoscroll.nvim' },
  { 'ggandor/lightspeed.nvim' },
  { 'PeterRincker/vim-argumentative' },
  { 'normen/vim-pio' },
  { 'ErichDonGubler/lsp_lines.nvim' },
  { 'thosakwe/vim-flutter' },
  { "b0o/schemastore.nvim" },
  { 'jose-elias-alvarez/null-ls.nvim' },
  { 'github/copilot.vim' },
  { 'CopilotC-Nvim/CopilotChat.nvim' },
}
