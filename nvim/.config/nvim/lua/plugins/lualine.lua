return {
  'hoob3rt/lualine.nvim',
  dependencies = { 'kyazdani42/nvim-web-devicons', lazy = true },
  config = function()
    local theme = require 'lualine.themes.gruvbox_dark'
    theme.normal.a.bg = '#b8bb26'

    require('lualine').setup {
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diff", { "diagnostics",
          sources = { "nvim_diagnostic" }
        } },
        lualine_c = {
          {
            "filename",
            path = 1
          }
        },
        lualine_x = { "encoding", "fileformat", "filetype" },
        lualine_y = { "progress" },
        lualine_z = { "location" }
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { { "filename", path = 1 } },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {}
      },
      -- tabline = {
      --   lualine_a = {},
      --   lualine_b = {'branch'},
      --   lualine_c = {'filename'},
      --   lualine_x = {},
      --   lualine_y = {},
      --   lualine_z = {'tabs'}
      -- },
      options = {
        theme = theme,
        -- section_separators = { left = '', right = ''},
        -- component_separators = { left = '', right = ''}
      }
    }
  end
}
