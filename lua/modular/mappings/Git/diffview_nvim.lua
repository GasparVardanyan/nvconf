local map = vim.keymap.set

map ("n", "<leader>gf", "<cmd>DiffviewFileHistory %<cr>", { desc = "diff view file history" })
