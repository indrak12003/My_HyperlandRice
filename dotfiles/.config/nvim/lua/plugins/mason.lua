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
          "ts_ls",
        },
      })
    end,
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")

      -- Lua
      lspconfig.lua_ls.setup({})

      -- Python
      lspconfig.pyright.setup({})

      -- TypeScript / JavaScript
      lspconfig.ts_ls.setup({})
    end,
  },
}
