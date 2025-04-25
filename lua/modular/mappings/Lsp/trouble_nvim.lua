local utils = require ("modular.utils")

local leaders = {"gr", "<leader>l", "<leader>"}

local map = utils.map_multi_leader
local unmap = utils.unmap_multi_leader

map ("n", leaders, "xx", "<cmd>Trouble diagnostics toggle<cr>", { desc = "diagnostics" })
map ("n", leaders, "xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", { desc = "buffer diagnostics" })
map ("n", leaders, "xs", "<cmd>Trouble symbols toggle focus=false<cr>", { desc = "symbols" })
map ("n", leaders, "xl", "<cmd>Trouble lsp toggle focus=false win.position=right<cr>", { desc = "IDK WHAT" }) -- TODO: what is this
map ("n", leaders, "xL", "<cmd>Trouble loclist toggle<cr>", { desc = "loclist" })
map ("n", leaders, "xQ", "<cmd>Trouble qflist toggle<cr>", { desc = "quickfix" })
