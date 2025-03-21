local map = vim.keymap.set

local api = require("nvim-tree.api")
map("n", "<C-n>", api.tree.toggle, { desc = "nvimtree toggle window" })
map("n", "<leader>e", api.tree.focus, { desc = "nvimtree focus window" })
