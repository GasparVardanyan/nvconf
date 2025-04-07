local map = vim.keymap.set

map ("n", "<leader>co", vim.cmd.CompilerOpen, {
	desc = "compiler open"
})
map ("n", "<leader>cs", vim.cmd.CompilerStop, {
	desc = "compiler stop"
})
map ("n", "<leader>cc", vim.cmd.CompilerToggleResults, {
	desc = "compiler toggle results"
})
