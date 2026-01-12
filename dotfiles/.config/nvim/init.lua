vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

-- Keymaps
require("config.keymaps")


-- Lazy Package Manager (Lazy.nvim)
require("config.lazy") 
