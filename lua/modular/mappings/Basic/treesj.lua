local map = vim.keymap.set

map ("n", "<leader>mm", vim.cmd.TSJToggle, { desc = "Split or Join code block with autodetect" })
map ("n", "<leader>ms", vim.cmd.TSJSplit, { desc = "Split code block" })
map ("n", "<leader>mj", vim.cmd.TSJJoin, { desc = "Join code block" })
