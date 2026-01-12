-- LEADER
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Opzioni comuni per tutte le mappature
local opts = { noremap = true, silent = true }

local keymap = vim.keymap.set

-----------------------------------------
-- File / Buffer
-----------------------------------------
keymap("n", "<leader>q", ":q<CR>", { desc = "Quit", unpack(opts) })
keymap("n", "<leader>w", ":w<CR>", { desc = "Save", unpack(opts) })

-----------------------------------------
-- Telescope
-----------------------------------------
keymap("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find Files", unpack(opts) })
keymap("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Live Grep", unpack(opts) })
keymap("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Buffers", unpack(opts) })
keymap("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { desc = "Help Tags", unpack(opts) })

-----------------------------------------
-- Neo-tree
-----------------------------------------
keymap("n", "<leader>e", ":Neotree toggle<CR>", { desc = "Toggle File Explorer", unpack(opts) })

-----------------------------------------
-- Null-ls
-----------------------------------------
keymap("n", "<leader>f", function()
  vim.lsp.buf.format({ async = true })
end, { desc = "Format file", unpack(opts) })
