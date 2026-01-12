return {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "williamboman/mason.nvim",
    "jay-babu/mason-null-ls.nvim",
  },

  config = function()
    require("mason-null-ls").setup({
      ensure_installed = {
        "black",
        "ruff",
        "stylua",
        "prettier",
      },
      automatic_installation = true,
    })

    local null_ls = require("null-ls")

    null_ls.setup({
      sources = {
        -- Formatter Python
        null_ls.builtins.formatting.black,

        -- Ruff come formatter (non diagnostico)
        null_ls.builtins.formatting.ruff,

        -- Lua formatter
        null_ls.builtins.formatting.stylua,

        -- Web formatter
        null_ls.builtins.formatting.prettier,
      },
    })
  end,
}
