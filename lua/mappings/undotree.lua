local map = vim.keymap.set

map('n', '<leader>tu', vim.cmd.UndotreeToggle, { desc = "Toggle UndoTree" })
