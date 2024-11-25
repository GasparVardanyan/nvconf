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

vim.api.nvim_create_autocmd({"User"}, {
	pattern = "LazyLoad",
	callback = function(data)
		if data.data == "gitsigns.nvim" then
			local gs = package.loaded.gitsigns
			map("n", "[h", gs.prev_hunk, { desc = "Previous Hunk" })
			map("n", "]h", gs.next_hunk, { desc = "Next Hunk"})
			map("n", "<leader>gd", gs.preview_hunk, { desc = "Diff Hunk"})
			map("n", "<leader>gu", gs.reset_hunk, { desc = "Undo Hunk"})
		elseif data.data == "nvim-tree.lua" then
			local api = require("nvim-tree.api")
			map("n", "<C-n>", api.tree.toggle, { desc = "nvimtree toggle window" })
			map("n", "<leader>e", api.tree.focus, { desc = "nvimtree focus window" })
		elseif data.data == "telescope.nvim" then
			local builtin = require("telescope.builtin")

			map("n", "<leader>ff", builtin.find_files, { desc = "telescope find files" })
			map("n", "<leader>fw", builtin.live_grep, { desc = "telescope live grep" })
			map("n", "<leader>fb", builtin.buffers, { desc = "telescope find buffers" })
			map("n", "<leader>fh", builtin.help_tags, { desc = "telescope help page" })
			map("n", "<leader>ma", builtin.marks, { desc = "telescope find marks" })
			map("n", "<leader>fo", builtin.oldfiles, { desc = "telescope find oldfiles" })
			map("n", "<leader>fz", builtin.current_buffer_fuzzy_find, { desc = "telescope find in current buffer" })
			map("n", "<leader>cm", builtin.git_commits, { desc = "telescope git commits" })
			map("n", "<leader>gt", builtin.git_status, { desc = "telescope git status" })
			--map("n", "<leader>pt", builtin.terms, { desc = "telescope pick hidden term" })

			map("n", "<leader>fa", "<cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>", { desc = "telescope find all files" })

			map('n', '<leader>fr', function()
				require('telescope.builtin').lsp_references()
			end, { desc = "LSP References" })
			map('n', '<leader>fi', function()
				require('telescope.builtin').lsp_implementations()
			end, { desc = "LSP Implementations" })
			map('n', '<leader>fd', function()
				require('telescope.builtin').lsp_definitions()
			end, { desc = "LSP Definitions" })
			map('n', '<leader>fs', function()
				require('telescope.builtin').lsp_document_symbols()
			end, { desc = "LSP Document Symbols" })
			map('n', '<leader>fW', function()
				require('telescope.builtin').lsp_workspace_symbols()
			end, { desc = "LSP Workspace Symbols" })
			map('n', '<leader>fD', function()
				require('telescope.builtin').diagnostics()
			end, { desc = "LSP Diagnostics" })
			map('n', '<leader>fI', function()
				require('telescope.builtin').lsp_incoming_calls()
			end, { desc = "LSP Incoming Calls" })
			map('n', '<leader>fO', function()
				require('telescope.builtin').lsp_outgoing_calls()
			end, { desc = "LSP Outgoing Calls" })

		elseif data.data == "plenary.nvim" then
		elseif data.data == "nvim-treesitter" then
		elseif data.data == "nvim-web-devicons" then
		elseif data.data == "NeoSolarized.nvim" then
		elseif data.data == "solarized.nvim" then
		elseif data.data == "solarized-osaka.nvim" then
		else
			print (data.data)
		end



	end
})
