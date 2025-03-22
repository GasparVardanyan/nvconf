local map = vim.keymap.set

map("n", "<Esc>", vim.cmd.noh, { desc = "general clear highlights" })

map("i", "<c-h>", "<Left>", { desc = "move left" })
map("i", "<c-j>", "<Down>", { desc = "move down" })
map("i", "<c-k>", "<Up>", { desc = "move up" })
map("i", "<c-l>", "<Right>", { desc = "move right" })
map("i", "<c-s-l>", "<Del>")
map("i", "<c-s-h>", "<BS>")

map("n", "<c-h>", "<c-w>h", { desc = "switch window left" })
map("n", "<c-j>", "<c-w>j", { desc = "switch window down" })
map("n", "<c-k>", "<c-w>k", { desc = "switch window up" })
map("n", "<c-l>", "<c-w>l", { desc = "switch window right" })

map("n", "<leader>V", "`[v`]")
map("n", "<leader>vC", vim.cmd.tabclose)
map("n", "<leader>vN", vim.cmd.tabnew)
map("n", "<leader>vd", vim.cmd.bdelete)
map("n", "<leader>vn", "<cmd>setlocal nu! rnu!<cr>")
map("n", "<leader>vo", vim.cmd.only)

map("t", "<C-x>", "<C-\\><C-N>", { desc = "terminal escape terminal mode" })
map("t", "<C-q>", "<C-\\><C-N>ZQ", { desc = "terminal escape terminal mode" })

-- Todo: conform these:
-- Moudle/Plugin leaders:
-- <leader>a - Ai - avante
-- <leader>s - Basic - grug-far
-- <leader>f - Basic - telescope
-- <leader>t - Basic - toggleterm
-- <leader>c - Compiler
-- <leader>d - Dap
-- <leader>L - LspSaga
-- <leader>g - Git
-- <leader>D - Db
-- <leader>l - Lint
-- <leader>T - Test

vim.cmd [[
	noremap <F1> :mksession! .vim.session
	noremap <F2> :source .vim.session
	noremap <F3> :! rm .vim.session
]]
