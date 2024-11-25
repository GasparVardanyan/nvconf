local map = vim.keymap.set

-- map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
map("i", "<sc-L>", "<Del>")
map("i", "<sc-H>", "<Backspace>")

map("n", "<C-I>", "<C-I>")

map("n", "<leader>V", "`[v`]")

map("n", "<C-J>", "<C-W><C-J>")
map("n", "<C-K>", "<C-W><C-K>")
map("n", "<C-L>", "<C-W><C-L>")
map("n", "<C-H>", "<C-W><C-H>")
