local map = vim.keymap.set

map ("n", "[c", function ()
	require ("treesitter-context").go_to_context (vim.v.count1)
end, { silent = true })

map ("n", "]c", function ()
	require ("treesitter-context").toggle ()
end, { silent = true })
