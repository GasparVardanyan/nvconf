local map = vim.keymap.set

map ("n", "<leader>pp", vim.cmd.CdProject, { desc = "cd project" })
map ("n", "<leader>pa", vim.cmd.CdProjectAdd, { desc = "add project" })
map ("n", "<leader>pd", vim.cmd.CdProjectDelete, { desc = "delete project" })
