-- mason installs and runs lsp servers
require("mason").setup()
require("mason-lspconfig").setup {
  ensure_installed = { "lua_ls", "yamlls", "gopls", "cmake", 'jsonls', 'clangd' },
}
local util = require "lspconfig.util"
local opts = { noremap = true, silent = true }

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
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>f', '<cmd>lua vim.lsp.buf.format({async = true})<CR>', opts)
  -- telescope mappings
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', ':lua require"telescope.builtin".lsp_references{}<cr>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>dd', ':lua require"telescope.builtin".diagnostics{}<cr>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', ':lua require"telescope.builtin".lsp_implementation{}<cr>', opts)

  require "lsp_signature".on_attach({
    bind = true, -- This is mandatory, otherwise border config won't get registered.
    doc_lines = 0,
    handler_opts = {
      border = "rounded"
    }
  }, bufnr)
end

-- cmake
require 'lspconfig'.cmake.setup {
  capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities()),
  on_attach = on_attach,
}

-- yaml
require 'lspconfig'.yamlls.setup {
  capabilities = require('cmp_nvim_lsp').default_capabilities(),
  on_attach = on_attach,
  settings = {
    yaml = {
      yamlVersion = 1.1,
      schemaStore = {
        url = "https://www.schemastore.org/api/json/catalog.json",
        enable = true,
      },
      format = {
        enable = true,
      },
      hover = true,
      validate = true,
      completion = true,
    }
  }
}

-- clangd
require 'lspconfig'.clangd.setup {
  capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities()),
  on_attach = on_attach,
  cmd = {
    "/home/t/dev/llvm-project/build/bin/clangd",
    "--background-index",
    "--query-driver=/home/t/.platformio/packages/toolchain-xtensa-esp32s3/bin/xtensa-esp32s3-elf*",
  },
  filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
}

-- local server_config = {
--   capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities()),
--   on_attach = on_attach,
--   filetypes = { "c", "cpp", "objc", "objcpp", "opencl" },
--   root_dir = function(fname)
--     return util.root_pattern("compile_commands.json", "compile_flags.txt", ".git")(fname)
--         or util.find_git_ancestor(fname)
--   end,
--   init_options = { cache = {
--     directory = vim.fs.normalize "~/.cache/ccls",
--   }},
-- }
-- require("ccls").setup { lsp = { lspconfig = server_config } }

--lua_ls lua
local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")
require 'lspconfig'.lua_ls.setup {
  capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities()),
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
        globals = { 'vim' },
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
require 'lspconfig'.gopls.setup {
  capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities()),
  on_attach = on_attach,
  flags = {
    allow_incremental_sync = false,
  },
  cmd = { 'gopls', 'serve' },
  filetypes = { 'go', 'gomod' },
  root_dir = util.root_pattern("go.work", "go.mod", ".git"),
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
      },
      staticcheck = true,
    },
  },
}

-- json

require 'lspconfig'.jsonls.setup {
  capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities()),
  on_attach = on_attach,
}
