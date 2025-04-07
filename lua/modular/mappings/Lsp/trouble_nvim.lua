local map = vim.keymap.set

map ("n", "<leader>lxx", "<cmd>Trouble diagnostics toggle<cr>", { desc = "lsp trouble diagnostics" })
map ("n", "<leader>lxX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", { desc = "lsp trouble buffer diagnostics" })
map ("n", "<leader>lxs", "<cmd>Trouble symbols toggle focus=false<cr>", { desc = "lsp trouble symbols" })
map ("n", "<leader>lxl", "<cmd>Trouble lsp toggle focus=false win.position=right<cr>", { desc = "lsp trouble IDK WHAT" }) -- TODO: what is this
map ("n", "<leader>lxL", "<cmd>Trouble loclist toggle<cr>", { desc = "lsp trouble loclist" })
map ("n", "<leader>lxQ", "<cmd>Trouble qflist toggle<cr>", { desc = "lsp trouble quickfix" })
