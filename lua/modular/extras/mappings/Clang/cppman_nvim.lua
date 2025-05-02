local map = vim.keymap.set

local cppman = require ("cppman")
-- TODO: implement a cplusplus/cppreference switch

map ("n", "<leader>Cm", function()
	cppman.open_cppman_for(vim.fn.expand("<cWORD>"))
end, {
	desc = "cppman <cWORD>"
})

map ("n", "<leader>Cc", cppman.input, { desc = "cppman" })
