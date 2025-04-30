local map = vim.keymap.set

map ("n", "<leader>cO", vim.cmd.CompilerOpen, { desc = "compiler open" })
map ("n", "<leader>cS", vim.cmd.CompilerStop, { desc = "compiler stop" })
map ("n", "<leader>cT", vim.cmd.CompilerToggleResults, { desc = "compiler toggle results" })
