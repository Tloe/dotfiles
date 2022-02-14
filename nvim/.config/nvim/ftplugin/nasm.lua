-- vim.cmd('au BufRead,BufNewFile *.asm setfiletype nasm')

vim.opt.listchars = {tab = '  '}

local opts = { noremap=true, silent=true }

vim.api.nvim_set_keymap('n', '<space>f', ':! asmfmt -w %<CR><CR>', opts)
