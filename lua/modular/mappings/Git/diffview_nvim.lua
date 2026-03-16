local map = vim.keymap.set

map ("n", "<leader>gf", "<cmd>DiffviewFileHistory %<cr>", { desc = "diff view file history" })
map ("n", "<leader>go", vim.cmd.DiffviewOpen, { desc = "diff view file" })
