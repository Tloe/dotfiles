vim.cmd [[
let g:nvim_tree_show_icons = {
  \ "git": 0,
  \ "folders": 1,
  \ "files": 1,
  \ "folder_arrows": 1,
  \  }
let g:nvim_tree_quit_on_open = 1
let g:nvim_tree_disable_window_picker = 1
]]


require'nvim-tree'.setup {
  filter = {
    dotfiles = true
  }
}
