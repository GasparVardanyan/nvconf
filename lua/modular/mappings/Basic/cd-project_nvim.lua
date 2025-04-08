local map = vim.keymap.set

map ("n", "<localleader>\\", vim.cmd.CdProject, { desc = "cd project" })
map ("n", "<localleader>a", vim.cmd.CdProjectAdd, { desc = "add project" })
map ("n", "<localleader>d", vim.cmd.CdProjectDelete, { desc = "delete project" })
