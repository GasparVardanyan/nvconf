local map = vim.keymap.set

map('n', '<leader>ut', vim.cmd.UndotreeToggle, { desc = "Toggle UndoTree" })
map('n', '<leader>uf', vim.cmd.UndotreeFocus, { desc = "Focus UndoTree" })
