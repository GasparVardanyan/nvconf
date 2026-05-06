local utils = require ("modular.utils")

local leaders = {"gr", "<leader>l", "<leader>"}

utils.map_multi_leader ("n", leaders, "Xx", "<cmd>Trouble diagnostics toggle<cr>", { desc = "diagnostics" })
utils.map_multi_leader ("n", leaders, "XX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", { desc = "buffer diagnostics" })
utils.map_multi_leader ("n", leaders, "Xs", "<cmd>Trouble symbols toggle focus=false<cr>", { desc = "symbols" })
utils.map_multi_leader ("n", leaders, "Xl", "<cmd>Trouble lsp toggle focus=false win.position=right<cr>", { desc = "IDK WHAT" }) -- TODO: what is this
utils.map_multi_leader ("n", leaders, "XL", "<cmd>Trouble loclist toggle<cr>", { desc = "loclist" })
utils.map_multi_leader ("n", leaders, "XQ", "<cmd>Trouble qflist toggle<cr>", { desc = "quickfix" })
