local map = vim.keymap.set

map ("n", "<leader>C", vim.cmd.CompilerOpen)
map ("n", "<leader>co", vim.cmd.CompilerOpen)
map ("n", "<leader>cs", vim.cmd.CompilerStop)
map ("n", "<leader>cc", vim.cmd.CompilerToggleResults)
