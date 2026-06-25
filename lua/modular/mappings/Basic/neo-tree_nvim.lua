local map = vim.keymap.set

-- map ("n", "<c-n>", "<cmd>Neotree toggle .<cr>", { desc = "neotree files" })
-- map ("n", "<c-s-n>", "<cmd>Neotree toggle buffers<cr>", { desc = "neotree buffers" })
-- map ("n", "<leader>e", "<cmd>Neotree focus<cr>", { desc = "neotree focus" })
map ("n", "<leader>eb", "<cmd>Neotree toggle buffers<cr>", { desc = "buffers" })
map ("n", "<leader>ef", "<cmd>Neotree toggle .<cr>", { desc = "files" })
map ("n", "<leader>eg", "<cmd>Neotree toggle git_status<cr>", { desc = "git status" })
map ("n", "<leader>eq", "<cmd>Neotree close<cr>", { desc = "close" })
map ("n", "<leader>es", "<cmd>Neotree document_symbols right<cr>", { desc = "document symbols" })
