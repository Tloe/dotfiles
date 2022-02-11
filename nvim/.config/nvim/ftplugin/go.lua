vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smarttab = true

vim.opt.listchars = {tab = '  '}

vim.cmd [[au BufWritePre * lua vim.lsp.buf.formatting_sync()]]
