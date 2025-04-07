local map = vim.keymap.set

map ("n", "<leader>dB", function() require ("dap").set_breakpoint (vim.fn.input "Breakpoint condition: ") end, { desc = "breakpoint conditional" })
map ("n", "<leader>dN", function() require"osv".launch({port = 8086}) end, { desc = "OSV" })
map ("n", "<leader>db", require ("dap").toggle_breakpoint, { desc = "toggle breakpoint" })
map ("n", "<leader>dc", require ("dap").continue, { desc = "continue" })
map ("n", "<leader>dd", require ("dap").disconnect, { desc = "disconnect" })
map ("n", "<leader>dp", require ("dap").pause, { desc = "pause" })
map ("n", "<leader>dsI", require ("dap").step_back, { desc = "back" })
map ("n", "<leader>dsO", require ("dap").step_out, { desc = "out" })
map ("n", "<leader>dsi", require ("dap").step_into, { desc = "into" })
map ("n", "<leader>dso", require ("dap").step_over, { desc = "over" })
map ("n", "<leader>dt", require ("dap").terminate, { desc = "terminate" })
map ("n", "<leader>dv", require ("nvim-dap-virtual-text").toggle, { desc = "toggle virtual text" })
