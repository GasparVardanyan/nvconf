local groups = require ("modular.autogroups")

vim.api.nvim_create_autocmd ({"BufNewFile", "BufReadPost"}, {
	group = vim.api.nvim_create_augroup (groups.NeorgOptions, { clear = true }),
	pattern = { "*.norg" },
	callback = function (args)
		local bufnr = args.buf

		-- TODO: replace these deprecated functions
		vim.api.nvim_buf_set_option (bufnr, 'number', false)
		vim.api.nvim_buf_set_option (bufnr, 'relativenumber', false)
		vim.api.nvim_buf_set_option (bufnr, 'conceallevel', 3)
		vim.api.nvim_buf_set_option (bufnr, 'concealcursor', 'nv')
	end,
})
