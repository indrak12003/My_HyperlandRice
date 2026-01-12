return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup()
    end,
  },

  {
    "williamboman/mason-lspconfig.nvim",
    version = "1.24.0",
    lazy = false,
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          -- LSP
          "lua_ls",
          "pyright",
          "bashls",
          "tsserver",
          "clangd",
          "jsonls",
          "yamlls"
        },
      })
    end
  },
  
  {
    "neovim/nvim-lspconfig",
    version = "0.1.7",       
    config = function()
      vim.g.lspconfig = { deprecated = false } -- nasconde il warning

      local lspconfig = require("lspconfig")

      ------------------------------------
      -- LUA
      ------------------------------------
      lspconfig.lua_ls.setup({
        settings = {
          Lua = {
            diagnostics = { globals = { "vim" } },
            format = { enable = true },
          },
        },
      })

      ------------------------------------
      -- PYTHON
      ------------------------------------
      lspconfig.pyright.setup({})
      -- Ruff per linting veloce
      lspconfig.ruff_lsp.setup({})

      ------------------------------------
      -- BASH
      ------------------------------------
      lspconfig.bashls.setup({})

      ------------------------------------
      -- TYPESCRIPT / JAVASCRIPT
      ------------------------------------
      lspconfig.tsserver.setup({})

      ------------------------------------
      -- C / C++
      ------------------------------------
      lspconfig.clangd.setup({})

      ------------------------------------
      -- JSON
      ------------------------------------
      lspconfig.jsonls.setup({})

      ------------------------------------
      -- YAML
      ------------------------------------
      lspconfig.yamlls.setup({})

    end,
  },
}
