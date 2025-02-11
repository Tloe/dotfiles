return {
  {
    'williamboman/mason.nvim',
    config = function()
      require("mason").setup()
    end,
  }, -- installs lsp servers
  {
    'williamboman/mason-lspconfig.nvim',
    opts = {
      ensure_installed = {
        "lua_ls",
        "yamlls",
        "gopls",
        "cmake",
        'jsonls',
        'clangd',
        'kotlin_language_server',
        'pyright',
        'html',
        'htmx',
        'templ',
      },
    },
  },
}
