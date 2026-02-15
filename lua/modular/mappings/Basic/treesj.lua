local map = vim.keymap.set

map ("n", "<leader>mm", function ()
	require ("treesj").toggle ()
end, { desc = "Split or Join code block with autodetect" })

map ("n", "<leader>ms", function ()
	require ("treesj").split ()
end, { desc = "Split code block" })

map ("n", "<leader>mj", function ()
	require ("treesj").join ()
end, { desc = "Join code block" })
