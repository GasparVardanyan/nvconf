local utils = require ("modular.utils")

local leaders = {"gr", "<leader>l", "<leader>"}

utils.map_multi_leader ("n", leaders, "xx", "<cmd>Trouble diagnostics toggle<cr>", { desc = "diagnostics" })
utils.map_multi_leader ("n", leaders, "xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", { desc = "buffer diagnostics" })
utils.map_multi_leader ("n", leaders, "xs", "<cmd>Trouble symbols toggle focus=false<cr>", { desc = "symbols" })
utils.map_multi_leader ("n", leaders, "xl", "<cmd>Trouble lsp toggle focus=false win.position=right<cr>", { desc = "IDK WHAT" }) -- TODO: what is this
utils.map_multi_leader ("n", leaders, "xL", "<cmd>Trouble loclist toggle<cr>", { desc = "loclist" })
utils.map_multi_leader ("n", leaders, "xQ", "<cmd>Trouble qflist toggle<cr>", { desc = "quickfix" })
