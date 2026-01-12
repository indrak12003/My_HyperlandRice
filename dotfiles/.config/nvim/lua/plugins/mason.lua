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
        },
      })
    end,
  },

  {
    "neovim/nvim-lspconfig",
    version = "*",       
    config = function()
      vim.g.lspconfig = { deprecated = false } -- nasconde il warning

      local lspconfig = require("lspconfig")

      -- Lua
      lspconfig.lua_ls.setup({})

      -- Python
      lspconfig.pyright.setup({})

      -- TypeScript
      lspconfig.tsserver.setup({})
    end,
  },
}
