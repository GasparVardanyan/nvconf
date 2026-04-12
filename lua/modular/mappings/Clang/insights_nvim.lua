local map = vim.keymap.set

map ("n", "<leader>CI", require ("insights").run_current_buf, { desc = "insights" })
map ("n", "<leader>CT", require ("insights").run_telescope, { desc = "insights telescope" })
