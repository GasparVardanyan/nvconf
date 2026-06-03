local map = vim.keymap.set

map ("n", "<leader>div", vim.cmd.DapImageView, { desc = "view" })
map ("n", "<leader>dic", vim.cmd.DapImageClose, { desc = "close" })
map ("n", "<leader>diC", vim.cmd.DapImageCloseAll, { desc = "close all" })
