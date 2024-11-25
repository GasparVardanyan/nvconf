local map = vim.keymap.set

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


map('n', '<leader>ft', '<cmd>Telescope telescope-tabs list_tabs<CR>', {
	desc = "Search on tabs"
})

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

