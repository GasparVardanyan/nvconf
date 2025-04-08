local groups = require ("modular.autogroups")

vim.api.nvim_create_autocmd ({"BufNewFile", "BufReadPost"}, {
	group = vim.api.nvim_create_augroup (groups.NeorgOptions, { clear = true }),
	pattern = { "*.norg" },
	callback = function ()

		vim.api.nvim_set_option_value ("number", false, {})
		vim.api.nvim_set_option_value ("relativenumber", false, {})
		vim.api.nvim_set_option_value ("conceallevel", 3, {})
		vim.api.nvim_set_option_value ("concealcursor", "nv", {})
	end,
})
