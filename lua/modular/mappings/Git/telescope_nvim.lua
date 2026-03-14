local map = vim.keymap.set
local telescope_builtin = require ("telescope.builtin")

map ("n", "<leader>fG", telescope_builtin.git_status, { desc = "git status" })

map ("n", "<leader>gs", telescope_builtin.git_status, { desc = "git status" })
