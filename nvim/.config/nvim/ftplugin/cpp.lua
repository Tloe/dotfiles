-- telescope : builtin.lsp_implementations
local map = require('util/map').map

vim.api.nvim_buf_set_option(0, "commentstring", "// %s")

map{'n', '<F12>', ':ClangdSwitchSourceHeader<cr>'}
