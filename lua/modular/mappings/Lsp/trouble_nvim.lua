local map = vim.keymap.set

map ("n", "<leader>lxx", "<cmd>Trouble diagnostics toggle<cr>")
map ("n", "<leader>lxX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>")
map ("n", "<leader>lxs", "<cmd>Trouble symbols toggle focus=false<cr>")
map ("n", "<leader>lxl", "<cmd>Trouble lsp toggle focus=false win.position=right<cr>")
map ("n", "<leader>lxL", "<cmd>Trouble loclist toggle<cr>")
map ("n", "<leader>lxQ", "<cmd>Trouble qflist toggle<cr>")
