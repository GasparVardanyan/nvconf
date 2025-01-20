local map = vim.keymap.set

local builtin = require("telescope.builtin")

map("n", "<leader>ff", builtin.find_files, { desc = "telescope find files" })
map("n", "<leader>fw", builtin.live_grep, { desc = "telescope live grep" })
map("n", "<leader>fb", builtin.buffers, { desc = "telescope find buffers" })
map("n", "<leader>fh", builtin.help_tags, { desc = "telescope help page" })
map("n", "<leader>ma", builtin.marks, { desc = "telescope find marks" })
map("n", "<leader>fo", builtin.oldfiles, { desc = "telescope find oldfiles" })
map("n", "<leader>fz", builtin.current_buffer_fuzzy_find, { desc = "telescope find in current buffer" })
-- map("n", "<leader>cm", builtin.git_commits, { desc = "telescope git commits" })
map("n", "<leader>gt", builtin.git_status, { desc = "telescope git status" })
--map("n", "<leader>pt", builtin.terms, { desc = "telescope pick hidden term" })
map('n', '<leader>fm', function()
	require('telescope.builtin').marks()
end, { desc = "telescope marks" })

map("n", "<leader>fa", "<cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>", { desc = "telescope find all files" })


map('n', '<leader>ft', '<cmd>Telescope telescope-tabs list_tabs<CR>', {
	desc = "Search tabs"
})
