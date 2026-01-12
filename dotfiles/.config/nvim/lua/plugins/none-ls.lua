return {
  "nvimtools/none-ls.nvim",
  dependencies = { "williamboman/mason.nvim", "jay-babu/mason-null-ls.nvim" },

  config = function()
    require("mason-null-ls").setup({
      ensure_installed = {
        "black",
        "ruff",
        "prettier",
        "stylua",
      },
      automatic_setup = true,
    })

    local null_ls = require("null-ls")

    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.prettier,
        null_ls.builtins.diagnostics.ruff,
      },
    })
  end,
}
