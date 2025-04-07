local map = vim.keymap.set

map ("n", "grxx", "<cmd>Trouble diagnostics toggle<cr>", { desc = "diagnostics" })
map ("n", "grxX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", { desc = "buffer diagnostics" })
map ("n", "grxs", "<cmd>Trouble symbols toggle focus=false<cr>", { desc = "symbols" })
map ("n", "grxl", "<cmd>Trouble lsp toggle focus=false win.position=right<cr>", { desc = "IDK WHAT" }) -- TODO: what is this
map ("n", "grxL", "<cmd>Trouble loclist toggle<cr>", { desc = "loclist" })
map ("n", "grxQ", "<cmd>Trouble qflist toggle<cr>", { desc = "quickfix" })

map ("n", "<leader>lxx", "<cmd>Trouble diagnostics toggle<cr>", { desc = "diagnostics" })
map ("n", "<leader>lxX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", { desc = "buffer diagnostics" })
map ("n", "<leader>lxs", "<cmd>Trouble symbols toggle focus=false<cr>", { desc = "symbols" })
map ("n", "<leader>lxl", "<cmd>Trouble lsp toggle focus=false win.position=right<cr>", { desc = "IDK WHAT" }) -- TODO: what is this
map ("n", "<leader>lxL", "<cmd>Trouble loclist toggle<cr>", { desc = "loclist" })
map ("n", "<leader>lxQ", "<cmd>Trouble qflist toggle<cr>", { desc = "quickfix" })

map ("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", { desc = "trouble diagnostics" })
map ("n", "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", { desc = "trouble buffer diagnostics" })
map ("n", "<leader>xs", "<cmd>Trouble symbols toggle focus=false<cr>", { desc = "trouble symbols" })
map ("n", "<leader>xl", "<cmd>Trouble lsp toggle focus=false win.position=right<cr>", { desc = "trouble IDK WHAT" }) -- TODO: what is this
map ("n", "<leader>xL", "<cmd>Trouble loclist toggle<cr>", { desc = "trouble loclist" })
map ("n", "<leader>xQ", "<cmd>Trouble qflist toggle<cr>", { desc = "trouble quickfix" })
