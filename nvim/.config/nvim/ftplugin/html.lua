local map = require('util/map').map

map{'n', '<leader>f', ':Prettier<cr>' }

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = { "*.html" },
  command = "Prettier"
})
