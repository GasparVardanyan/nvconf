local map = vim.keymap.set

map ("n", "<leader>D", vim.cmd.DBUIToggle, { desc = "dadbod toggle ui" })
map ("n", "<leader>DD", vim.cmd.DBUIToggle, { desc = "dadbod toggle ui" })
map ("n", "<leader>Da", vim.cmd.DBUIAddConnection, { desc = "dadbod add connection" })
