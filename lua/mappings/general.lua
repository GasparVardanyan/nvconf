local map = vim.keymap.set

-- https://github.com/NvChad/NvChad/blob/v2.5/lua/nvchad/mappings.lua

-- map("n", ";", ":", { desc = "CMD enter command mode" })
map("n", "<Esc>", "<cmd>noh<CR>", { desc = "general clear highlights" })

map("i", "<c-h>", "<Left>")
map("i", "<c-j>", "<Down>")
map("i", "<c-k>", "<Up>")
map("i", "<c-l>", "<Right>")
map("i", "<sc-l>", "<Del>")
map("i", "<sc-h>", "<BS>")

map("n", "<C-i>", "<C-i>")

map("n", "<leader>V", "`[v`]")

map("n", "<C-j>", "<C-w><C-j>")
map("n", "<C-k>", "<C-w><C-k>")
map("n", "<C-l>", "<C-w><C-l>")
map("n", "<C-h>", "<C-w><C-h>")
