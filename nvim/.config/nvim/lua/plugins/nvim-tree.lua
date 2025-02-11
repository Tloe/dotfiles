return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  opts = {
    filters = {
      dotfiles = true
    },
    renderer = {
      icons = {
        show = {
          file = true,
          folder = true,
          folder_arrow = true,
          git = false,
        },
      },
    },
    actions = {
      open_file = {
        quit_on_open = true,
        window_picker = {
          enable = true
        }
      }
    }
  }
}
