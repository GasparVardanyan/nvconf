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

map("t", "<C-x>", "<C-\\><C-N>", { desc = "terminal escape terminal mode" })
map("t", "<C-q>", "<C-\\><C-N>ZQ", { desc = "terminal escape terminal mode" })

vim.cmd [[
	noremap <F1> :mksession! .vim.session
	noremap <F2> :source .vim.session
	noremap <F3> :! rm .vim.session
]]

-- map("n", "<C-i>", "<C-i>")

vim.api.nvim_create_autocmd({"User"}, {
	pattern = "LazyLoad",
	callback = function(data)
		if data.data == "gitsigns.nvim" then
			require "oldmappings.gitsigns"
		elseif data.data == "diffview.nvim" then
			require "oldmappings.diffview"
		elseif data.data == "nvim-tree.lua" then
			require "oldmappings.nvim-tree"
		elseif data.data == "telescope.nvim" then
			require "oldmappings.telescope"
		elseif data.data == "grug-far.nvim" then
			require "oldmappings.grug-far"
		elseif data.data == "nvim-spectre" then
			require "oldmappings.spectre"
		elseif data.data == "lazygit.nvim" then
			require "oldmappings.lazygit"
		elseif data.data == "undotree" then
			require "oldmappings.undotree"
		elseif data.data == "tagbar" then
			require "oldmappings.tagbar"
		elseif data.data == "nvim-lspconfig" then
			require "oldmappings.lspconfig"
		elseif data.data == "outline.nvim" then
			require "oldmappings.outline"
		elseif data.data == "nvim-cmp" then
			require "oldmappings.nvim-cmp"
		elseif data.data == "lspsaga.nvim" then
			require "oldmappings.lspsaga"
		elseif data.data == "dropbar.nvim" then
			require "oldmappings.dropbar"
		end
	end
})
