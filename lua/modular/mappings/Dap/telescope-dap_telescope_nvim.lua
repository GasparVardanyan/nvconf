local map = vim.keymap.set
local telescope = require ("telescope")

map ("n", "<leader>dfc", telescope.extensions.dap.commands, { desc = "commands" })
map ("n", "<leader>dfC", telescope.extensions.dap.configurations, { desc = "configurations" })
map ("n", "<leader>dfb", telescope.extensions.dap.list_breakpoints, { desc = "list breakpoints" })
map ("n", "<leader>dfv", telescope.extensions.dap.variables, { desc = "variables" })
map ("n", "<leader>dff", telescope.extensions.dap.frames, { desc = "frames" })
