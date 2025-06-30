return {
  {
    'williamboman/mason.nvim',
    config = function()
      require("mason").setup()
    end,
  },
  {
    'williamboman/mason-lspconfig.nvim',
    dependencies = { 'williamboman/mason.nvim' },
    opts = {
      ensure_installed = {
        "lua_ls",
        "yamlls",
        "gopls",
        "cmake",
        'jsonls',
        'kotlin_language_server',
        'pyright',
        'html',
        'htmx',
        'templ',
      },
    },
  },
  {
    'neovim/nvim-lspconfig',
    opts = {
      servers = {
        clangd = {
          mason = false,
        },
      },
    },
    dependencies = { 'williamboman/mason-lspconfig.nvim', 'williamboman/mason.nvim' },
    config = function()
      local util = require "lspconfig.util"

      -- vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, { desc = "Show diagnostics float" })
      vim.keymap.set('n', '`', vim.diagnostic.goto_prev, { desc = "Previous diagnostic" })
      vim.keymap.set('n', '<BS>', vim.diagnostic.goto_next, { desc = "Next diagnostic" })
      -- vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, { desc = "Diagnostics to loclist" })

      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local bufnr = args.buf
          -- Enable completion triggered by <c-x><c-o>
          vim.bo[bufnr].omnifunc = 'v:lua.vim.lsp.omnifunc'

          local function bufmap(mode, lhs, rhs, desc)
            vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
          end

          -- Mappings.
          bufmap('n', '<space>gd', vim.lsp.buf.declaration, "Go to declaration")
          bufmap('n', 'gd', vim.lsp.buf.definition, "Go to definition")
          bufmap('n', 'K', vim.lsp.buf.hover, "Hover documentation")
          bufmap('n', '<C-k>', vim.lsp.buf.signature_help, "Signature help")
          -- bufmap('n', '<space>D', vim.lsp.buf.type_definition, "Type definition")
          bufmap('n', '<space>rn', vim.lsp.buf.rename, "Rename symbol")
          bufmap('n', '<space>ca', vim.lsp.buf.code_action, "Code action")
          bufmap('n', '<space>f', function() vim.lsp.buf.format({ async = true }) end, "Format")

          -- Telescope mappings
          local tb = require("telescope.builtin")
          bufmap('n', 'gr', tb.lsp_references, "LSP References")
          bufmap('n', '<space>dd', tb.diagnostics, "Workspace Diagnostics")
          bufmap('n', 'gi', tb.lsp_implementations, "LSP Implementations")
        end
      })

      -- dart
      require 'lspconfig'.dartls.setup {
        capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities()),
      }

      -- cmake
      require 'lspconfig'.cmake.setup {
        capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities()),
      }

      -- yaml
      require 'lspconfig'.yamlls.setup {
        capabilities = require('cmp_nvim_lsp').default_capabilities(),
        settings = {
          yaml = {
            yamlVersion = 1.1,
            schemaStore = {
              url = "",
              enable = false,
            },
            schemas = require('schemastore').yaml.schemas(),
            format = {
              enable = true,
            },
            hover = true,
            validate = true,
            completion = true,
          }
        }
      }

      -- kotlin
      require 'lspconfig'.kotlin_language_server.setup {}

      -- clangd
      -- require 'lspconfig'.clangd.setup {
      --   capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities()),
      --   cmd = {
      --     --    "/usr/local/bin/clangd",
      --     "/home/t/dev/llvm-project/build/bin/clangd",
      --     "--background-index",
      --     "--query-driver=/home/t/.platformio/packages/toolchain-xtensa-esp32s3/bin/xtensa-esp32s3-elf-g*",
      --   },
      --   filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
      -- }

      require 'lspconfig'.clangd.setup {
        capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities()),
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

      require 'lspconfig'.pyright.setup {}

      require 'lspconfig'.lua_ls.setup {
        on_init = function(client)
          if client.workspace_folders then
            local path = client.workspace_folders[1].name
            if path ~= vim.fn.stdpath('config') and (vim.loop.fs_stat(path .. '/.luarc.json') or vim.loop.fs_stat(path .. '/.luarc.jsonc')) then
              return
            end
          end

          client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
            runtime = {
              -- Tell the language server which version of Lua you're using
              -- (most likely LuaJIT in the case of Neovim)
              version = 'LuaJIT'
            },
            -- Make the server aware of Neovim runtime files
            workspace = {
              checkThirdParty = false,
              library = {
                vim.env.VIMRUNTIME
                -- Depending on the usage, you might want to add additional paths here.
                -- "${3rd}/luv/library"
                -- "${3rd}/busted/library",
              }
              -- or pull in all of 'runtimepath'. NOTE: this is a lot slower
              -- library = vim.api.nvim_get_runtime_file("", true)
            }
          })
        end,
        settings = {
          Lua = {}
        }
      }

      --lua_ls lua
      -- local runtime_path = vim.split(package.path, ';')
      -- table.insert(runtime_path, "lua/?.lua")
      -- table.insert(runtime_path, "lua/?/init.lua")
      -- require 'lspconfig'.lua_ls.setup {
      --   capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities()),
      --   settings = {
      --     Lua = {
      --       runtime = {
      --         -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
      --         version = 'LuaJIT',
      --         -- Setup your lua path
      --         path = runtime_path,
      --       },
      --       diagnostics = {
      --         -- Get the language server to recognize the `vim` global
      --         globals = { 'vim' },
      --       },
      --       workspace = {
      --         -- Make the server aware of Neovim runtime files
      --         library = vim.api.nvim_get_runtime_file("", true),
      --         maxPreload = 10000,
      --         preloadFileSize = 1000
      --       },
      --       -- Do not send telemetry data containing a randomized but unique identifier
      --       telemetry = {
      --         enable = false,
      --       },
      --     },
      --   },
      -- }
      --

      -- gopls
      require 'lspconfig'.gopls.setup {
        capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities()),
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
        settings = {
          json = {
            schemas = require('schemastore').json.schemas(),
            validate = { enable = true },
          },
        },
      }
      --
      -- emmet
      require 'lspconfig'.emmet_ls.setup {
        capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities()),
      }


      -- html
      local htmlCapabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
      htmlCapabilities.textDocument.completion.completionItem.snippetSupport = true

      require 'lspconfig'.html.setup {
        capabilities = htmlCapabilities,
        filetypes = { "html" },
      }

      require 'lspconfig'.htmx.setup {
        capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities()),
        filetypes = { "html" },
      }

      require 'lspconfig'.templ.setup {
        capabilities = require('cmp_nvim_lsp').default_capabilities(),
        filetypes = { "templ" },
      }
      require 'lspconfig'.ts_ls.setup {
        capabilities = require('cmp_nvim_lsp').default_capabilities(),
        filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" }
      }

      local cssCapabilities = vim.lsp.protocol.make_client_capabilities()
      cssCapabilities.textDocument.completion.completionItem.snippetSupport = true

      require 'lspconfig'.cssls.setup {
        capabilities = cssCapabilities,
      }

      require 'lspconfig'.svelte.setup {
        capabilities = require('cmp_nvim_lsp').default_capabilities(),
      }
    end,
  }
}
