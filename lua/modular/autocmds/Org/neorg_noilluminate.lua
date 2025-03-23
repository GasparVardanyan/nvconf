vim.api.nvim_create_autocmd ("FileType", {
	pattern = { "norg" },
	callback = function (args)
		local bufnr = args.buf

		vim.api.nvim_buf_call (bufnr, vim.cmd.IlluminateToggleBuf)
	end,
})
