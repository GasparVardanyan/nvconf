local map = vim.keymap.set

map("n", "<Esc>", "<cmd>noh<CR>", { desc = "general clear highlights" })

map("i", "<c-h>", "<Left>", { desc = "move left" })
map("i", "<c-j>", "<Down>", { desc = "move down" })
map("i", "<c-k>", "<Up>", { desc = "move up" })
map("i", "<c-l>", "<Right>", { desc = "move right" })
map("i", "<m-l>", "<Del>")
map("i", "<m-h>", "<BS>")

map("n", "<c-h>", "<c-w>h", { desc = "switch window left" })
map("n", "<c-j>", "<c-w>j", { desc = "switch window down" })
map("n", "<c-k>", "<c-w>k", { desc = "switch window up" })
map("n", "<c-l>", "<c-w>l", { desc = "switch window right" })

map("n", "<leader>V", "`[v`]")
map("n", "<leader>bd", "<cmd>bdelete<cr>")
map("n", "<leader>tn", "<cmd>tabnew<cr>")
map("n", "<leader>tc", "<cmd>tabclose<cr>")
map("n", "<leader>O", "<cmd>only<cr>")
map("n", "<leader>n", "<cmd>setlocal nu! rnu!<cr>")

map("n", "<leader>N", "<cmd>Neorg<cr>") -- TODO: move to config.mappings.Org.neorg_nvim

map("t", "<C-x>", "<C-\\><C-N>", { desc = "terminal escape terminal mode" })
map("t", "<C-q>", "<C-\\><C-N>ZQ", { desc = "terminal escape terminal mode" })

vim.cmd [[
	noremap <F1> :mksession! .vim.session
	noremap <F2> :source .vim.session
	noremap <F3> :! rm .vim.session
]]
