local map = vim.keymap.set

map ("n", "<leader>dB", function() require ("dap").set_breakpoint (vim.fn.input "Breakpoint condition: ") end, { desc = "dap breakpoint conditional" })
map ("n", "<leader>dN", function() require"osv".launch({port = 8086}) end, { desc = "dap OSV" })
map ("n", "<leader>db", require ("dap").toggle_breakpoint, { desc = "dap toggle breakpoint" })
map ("n", "<leader>dc", require ("dap").continue, { desc = "dap continue" })
map ("n", "<leader>dd", require ("dap").disconnect, { desc = "dap disconnect" })
map ("n", "<leader>dp", require ("dap").pause, { desc = "dap pause" })
map ("n", "<leader>dsI", require ("dap").step_back, { desc = "dap step back" })
map ("n", "<leader>dsO", require ("dap").step_out, { desc = "dap step out" })
map ("n", "<leader>dsi", require ("dap").step_into, { desc = "dap step into" })
map ("n", "<leader>dso", require ("dap").step_over, { desc = "dap step over" })
map ("n", "<leader>dt", require ("dap").terminate, { desc = "dap terminate" })
map ("n", "<leader>dv", require ("nvim-dap-virtual-text").toggle, { desc = "dap toggle virtual text" })
