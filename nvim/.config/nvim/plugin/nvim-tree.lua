require'nvim-tree'.setup {
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
      window_picker ={
        enable = true
      }
    }
  }
}
