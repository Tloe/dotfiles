return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-ui-select.nvim",
    },
    config = function()
      -- Basic Telescope setup
      require('telescope').setup {
        defaults = {
          -- your Telescope defaults here (e.g., vimgrep_arguments, prompt_prefix, etc.)
        },
      }
      -- Enable Telescope as the handler for vim.ui.select
      require('telescope').load_extension('ui-select')
    end,
  },
}
