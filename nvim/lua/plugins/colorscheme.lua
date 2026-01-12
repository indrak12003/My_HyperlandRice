return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "mocha", -- latte, frappe, macchiato, mocha
        transparent_background = true,
        term_colors = true,
        integrations = {
          treesitter = true,
          cmp = true,
          gitsigns = true,
          telescope = true,
          nvimtree = true,
          markdown = true,
        },
      })

      vim.cmd("colorscheme catppuccin")
    end,
  },
}

