local map = vim.keymap.set

map ("n", "<leader>Pp", vim.cmd.CdProject, { desc = "cd project" })
map ("n", "<leader>Pa", vim.cmd.CdProjectAdd, { desc = "add project" })
map ("n", "<leader>Pd", vim.cmd.CdProjectDelete, { desc = "delete project" })
