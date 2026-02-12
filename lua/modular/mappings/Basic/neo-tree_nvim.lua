local map = vim.keymap.set

-- map ("n", "<c-n>", "<cmd>Neotree toggle .<cr>", { desc = "neotree files" })
-- map ("n", "<c-s-n>", "<cmd>Neotree toggle buffers<cr>", { desc = "neotree buffers" })
-- map ("n", "<leader>e", "<cmd>Neotree focus<cr>", { desc = "neotree focus" })
map ("n", "<leader>e", "<cmd>Neotree toggle .<cr>", { desc = "neotree files" })
map ("n", "<leader>E", "<cmd>Neotree toggle buffers<cr>", { desc = "neotree buffers" })
