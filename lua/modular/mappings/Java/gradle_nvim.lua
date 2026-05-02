local map = vim.keymap.set

map ("n", "<leader>jgg", vim.cmd.Gradle, { desc = "gradle" })
map ("n", "<leader>jge", vim.cmd.GradleExec, { desc = "exec" })
map ("n", "<leader>jgf", vim.cmd.GradleFavorites, { desc = "favorites" })
map ("n", "<leader>jgi", vim.cmd.GradleInit, { desc = "init" })
