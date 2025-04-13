local map = vim.keymap.set

map ("n", "<leader>ut", vim.cmd.UndotreeToggle, { desc = "toggle" })
map ("n", "<leader>uf", vim.cmd.UndotreeFocus, { desc = "focus" })
map ("n", "<leader>uh", vim.cmd.UndotreeHide, { desc = "hide" })
