vim.api.nvim_create_autocmd ({"BufNewFile", "BufReadPost"}, {
	pattern = { "*.norg" },
	callback = function (args)
		local bufnr = args.buf

		vim.api.nvim_buf_call (bufnr, vim.cmd.IlluminateToggleBuf)
	end,
})
