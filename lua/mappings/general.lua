local map = vim.keymap.set

map("n", "<Esc>", "<cmd>noh<CR>", { desc = "general clear highlights" })

map("i", "<c-h>", "<Left>", { desc = "move left" })
map("i", "<c-j>", "<Down>", { desc = "move down" })
map("i", "<c-k>", "<Up>", { desc = "move up" })
map("i", "<c-l>", "<Right>", { desc = "move right" })
map("i", "<sc-l>", "<Del>")
map("i", "<sc-h>", "<BS>")

map("n", "<c-h>", "<c-w>h", { desc = "switch window left" })
map("n", "<c-j>", "<c-w>j", { desc = "switch window down" })
map("n", "<c-k>", "<c-w>k", { desc = "switch window up" })
map("n", "<c-l>", "<c-w>l", { desc = "switch window right" })

map("n", "<leader>V", "`[v`]")

-- map("n", "<C-i>", "<C-i>")
