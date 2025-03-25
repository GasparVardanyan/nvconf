local map = vim.keymap.set

map ("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>")
map ("n", "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>")
map ("n", "<leader>xs", "<cmd>Trouble symbols toggle focus=false<cr>")
map ("n", "<leader>xl", "<cmd>Trouble lsp toggle focus=false win.position=right<cr>")
map ("n", "<leader>xL", "<cmd>Trouble loclist toggle<cr>")
map ("n", "<leader>xQ", "<cmd>Trouble qflist toggle<cr>")
