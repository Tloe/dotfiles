local lsp = require'lspconfig'

local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }


  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', '<leader>H', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', 'rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '`', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', '<BS>', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

  -- telescope mappings
  buf_set_keymap('n', 'gr', ':lua require"telescope.builtin".lsp_references{}<cr>', opts)
  buf_set_keymap('n', '<leader>dd', ':lua require"telescope.builtin".diagnostics{}<cr>', opts)
  buf_set_keymap('n', 'gi', ':lua require"telescope.builtin".lsp_implementation{}<cr>', opts)
end

lsp.gopls.setup{
  cmd = {'gopls'},
  flags = {
    debounce_text_changes = 150,
  },
  on_attach = on_attach
}

require "lsp_signature".setup({
  bind = true, -- This is mandatory, otherwise border config won't get registered.
  doc_lines =0,
  handler_opts = {
    border = "rounded"
  }
})

local system_name = "Linux" -- (Linux, macOS, or Windows)
local sumneko_root_path = '/usr/lib/lua-language-server'
local sumneko_binary = sumneko_root_path.."/bin/"..system_name.."/lua-language-server"

lsp.sumneko_lua.setup({
  cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"};
  -- An example of settings for an LSP server.
  --    For more options, see nvim-lsp
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
        -- Setup your lua path
        path = vim.split(package.path, ';'),
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = {
          [vim.fn.expand('$VIMRUNTIME/lua')] = true,
          [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
        },
      },
    }
  },

  on_attach = on_attach
})

lsp.clangd.setup{
  on_attach = on_attach
}
lsp.cmake.setup{}
lsp.yamlls.setup{
  on_attach = on_attach
}

---- asm

-- local configs = require 'lspconfig.configs'

-- if not configs.asm_lsp then
--   configs.asm_lsp = {
--     default_config = {
--       cmd = {'/home/t/.cargo/bin/asm-lsp'};
--       filetypes = {'nasm','asm', 's', "S"};
--       root_dir = function(fname)
--         return vim.fn.getcwd()
--       end
--     }
--   }
-- end

-- lsp.asm_lsp.setup{
--   on_attach = on_attach
-- }

