local map = require('util/map').map

map{'i', '<F1>', '<C-o>:echo<cr>', {noremap = false}} -- Disable help
map{'n', '<F1>', ':echo<cr>', {noremap = false}}
map{'n','<Z>', '<Nop>', {noremap = false}}            -- Dont put in background

map{'i', 'jj', '<Esc>'}

map{'n', '<leader>zz', ':split<cr><C-w><C-j>:lua require"telescope.builtin".find_files{}<cr>'} --new split move to and open file
map{'n', '<leader>ss', ':vsplit<cr><C-w><C-l>:lua require"telescope.builtin".find_files{}<cr>'} --new split move to and open file
map{'n', '<C-s>', ':vsplit<cr>'}                    	-- vsplit
map{'n', '<C-z>', ':split<cr>'}                       -- splitt
map{'n', '<C-q>', ':quit<cr>', {noremap = false }}    -- quit split
map{'n', '<leader>bd', ':BD!<cr>'}

map{'n', '<C-n>', ':bp<cr>'}                          -- prev buffer
map{'n', '<C-m>', ':bn<cr>'}                          -- next buffer

map{'n', '<leader>s', ':%s/<C-r><C-w>/'}              -- Substitute

map{'n','<S-z>', '<Nop>'}

map{'n', '<C-h>', '<C-w><C-h>'}
map{'n', '<C-j>', '<C-w><C-j>'}
map{'n', '<C-k>', '<C-w><C-k>'}
map{'n', '<C-l>', '<C-w><C-l>'}
map{'n', '<C-Left>', '<C-w><C-h>'}
map{'n', '<C-Down>', '<C-w><C-j>'}
map{'n', '<C-Up>', '<C-w><C-k>'}
map{'n', '<C-Right>', '<C-w><C-l>'}

map{'n', '<F1>', ':NvimTreeToggle<CR>'}

map{'n', '<space>cc', '<cmd> noh<cr>'}

map{'n', '<leader>yy', '"+yy'}

map{'n', '<space>rr', ':LspRestart<cr>'}

-- telescope
map{'n', '<C-p>', ':lua require"telescope.builtin".find_files{}<cr>'}
map{'n', '<C-g>', ':lua require"telescope.builtin".live_grep{}<cr>'}
map{'n', '<C-a>', ':lua require"telescope.builtin".grep_string{}<cr>'}
map{'n', '<C-b>', ':lua require"telescope.builtin".buffers{}<cr>'}
map{'n', '<C-f>', ':lua require"telescope.builtin".file_browser{}<cr>'}
map{'n', '<leader>hh', ':lua require("telescope.builtin").help_tags{}<cr>'}
map{'n', '<space>c', ':lua require"telescope.builtin".find_files{ cwd = "~/.config/nvim/" }<cr>'}


-- vim.cmd([
-- [
-- " Move line(s) macros
-- inoremap        <C-,> <ESC> :m .+1<CR>==gi
-- inoremap        <C-.> <ESC> :m .-2<CR>==gi
-- vnoremap        <C-,>       :m '>+1<CR>gv=gv
-- vnoremap        <C-.>       :m '<-2<CR>gv=gv

