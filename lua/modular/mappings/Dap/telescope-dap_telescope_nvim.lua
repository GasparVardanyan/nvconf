local map = vim.keymap.set

map ("n", "<leader>dfc", require ("telescope").extensions.dap.commands)
map ("n", "<leader>dfC", require ("telescope").extensions.dap.configurations)
map ("n", "<leader>dfb", require ("telescope").extensions.dap.list_breakpoints)
map ("n", "<leader>dfv", require ("telescope").extensions.dap.variables)
map ("n", "<leader>dff", require ("telescope").extensions.dap.frames)
