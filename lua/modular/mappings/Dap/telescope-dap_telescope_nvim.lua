local map = vim.keymap.set

map ("n", "<leader>dfc", require ("telescope").extensions.dap.commands, { desc = "dap telescope commands" })
map ("n", "<leader>dfC", require ("telescope").extensions.dap.configurations, { desc = "dap telescope configurations" })
map ("n", "<leader>dfb", require ("telescope").extensions.dap.list_breakpoints, { desc = "dap telescope list_breakpoints" })
map ("n", "<leader>dfv", require ("telescope").extensions.dap.variables, { desc = "dap telescope variables" })
map ("n", "<leader>dff", require ("telescope").extensions.dap.frames, { desc = "dap telescope frames" })
