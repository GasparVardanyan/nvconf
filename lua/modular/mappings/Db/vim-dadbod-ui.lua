local map = vim.keymap.set

map ("n", "<leader>D", vim.cmd.DBUIToggle, { desc = "toggle ui" })
map ("n", "<leader>DD", vim.cmd.DBUIToggle, { desc = "toggle ui" })
map ("n", "<leader>Da", vim.cmd.DBUIAddConnection, { desc = "add connection" })
