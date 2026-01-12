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
    lazy = false,
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "pyright",
          "ts_ls", -- nuovo nome
        },
      })
    end,
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      local lsp = vim.lsp.config

      -- Lua
      lsp.lua_ls.setup({})

      -- Python
      lsp.pyright.setup({})

      -- TypeScript/JavaScript
      lsp.ts_ls.setup({})
    end,
  },
}
