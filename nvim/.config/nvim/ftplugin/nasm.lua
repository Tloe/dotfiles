-- vim.cmd('au BufRead,BufNewFile *.asm setfiletype nasm')

vim.opt.listchars = {tab = '  '}

local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
local opts = { noremap=true, silent=true }
buf_set_keymap('n', '<space>f', ':! asmfmt -w %<CR><CR>', opts)
