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
          "ts_ls",
          "clangd",
          "jsonls",
          "yamlls",

          -- Tools
          "ruff",
          "black",
          "shellcheck",
          "shfmt",
          "stylua",
        },
      })
    end,setup({})

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
      lspconfig.typescript-language-server.setup({})

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
