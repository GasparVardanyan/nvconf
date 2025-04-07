local map = vim.keymap.set

map ("n", "<leader>dfc", require ("telescope").extensions.dap.commands, { desc = "commands" })
map ("n", "<leader>dfC", require ("telescope").extensions.dap.configurations, { desc = "configurations" })
map ("n", "<leader>dfb", require ("telescope").extensions.dap.list_breakpoints, { desc = "list breakpoints" })
map ("n", "<leader>dfv", require ("telescope").extensions.dap.variables, { desc = "variables" })
map ("n", "<leader>dff", require ("telescope").extensions.dap.frames, { desc = "frames" })
