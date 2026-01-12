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
          lua,
          pyright
        },
      })
    end,
  },

  {
    "neovim/nvim-lspconfig",
    version = "0.1.7",       
    config = function()
      vim.g.lspconfig = { deprecated = false } -- nasconde il warning

      local lspconfig = require("lspconfig")

      -- Lua
      lspconfig.lua_ls.setup({})

      -- Python
      lspconfig.pyright.setup({})

    end,
  },
}
