local opts = { noremap=true, silent=true }

vim.api.nvim_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
vim.api.nvim_set_keymap('n', '`', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
vim.api.nvim_set_keymap('n', '<BS>', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
vim.api.nvim_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)

local function on_attach(_, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
  -- telescope mappings
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', ':lua require"telescope.builtin".lsp_references{}<cr>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>dd', ':lua require"telescope.builtin".diagnostics{}<cr>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', ':lua require"telescope.builtin".lsp_implementation{}<cr>', opts)
end


local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

-- cmake
require'lspconfig'.cmake.setup{
  capabilities = capabilities,
  on_attach = on_attach,
}

-- yaml
require'lspconfig'.yamlls.setup{
  capabilities = capabilities,
  on_attach = on_attach,
}

-- clangd
require'lspconfig'.clangd.setup{
  capabilities = capabilities,
  on_attach = on_attach,
}

--sumneko lua
local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")
require'lspconfig'.sumneko_lua.setup {
  capabilities = capabilities,
  on_attach = on_attach,
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
        -- Setup your lua path
        path = runtime_path,
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}


-- gopls
require'lspconfig'.gopls.setup{
  capabilities = capabilities,
  cmd = {'gopls'},
  flags = {
    debounce_text_changes = 150, -- never send document change notifications to the server more frequently than the X ms
  },
  on_attach = on_attach
}

-- lsp_signature
require "lsp_signature".setup{
  capabilities = capabilities,
  bind = true, -- This is mandatory, otherwise border config won't get registered.
  doc_lines = 0,
  handler_opts = {
    border = "rounded"
  }
}
