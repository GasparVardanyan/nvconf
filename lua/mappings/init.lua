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
map("n", "<leader>D", "<cmd>bdelete<cr>")
map("n", "<leader>N", "<cmd>tabnew<cr>")
map("n", "<leader>C", "<cmd>tabclose<cr>")
map("n", "<leader>G", "<cmd>DiffviewFileHistory %<cr>") -- TODO: move to mappings/diffview.lua

-- map("n", "<C-i>", "<C-i>")

vim.api.nvim_create_autocmd({"User"}, {
	pattern = "LazyLoad",
	callback = function(data)
		if data.data == "gitsigns.nvim" then
			require "mappings.gitsigns"
		elseif data.data == "nvim-tree.lua" then
			require "mappings.nvim-tree"
		elseif data.data == "telescope.nvim" then
			require "mappings.telescope"
		elseif data.data == "nvim-spectre" then
			require "mappings.spectre"
		elseif data.data == "lazygit.nvim" then
			require "mappings.lazygit"
		elseif data.data == "undotree" then
			require "mappings.undotree"
		elseif data.data == "tagbar" then
			require "mappings.tagbar"
		elseif data.data == "nvim-lspconfig" then
			require "mappings.lspconfig"
		elseif data.data == "outline.nvim" then
			require "mappings.outline"
		end
	end
})
