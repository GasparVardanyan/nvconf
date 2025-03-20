vim.api.nvim_create_autocmd ("FileType", {
	pattern = { "neo-tree" },
	callback = function (args)
		local bufnr = args.buf

		vim.api.nvim_buf_call (bufnr, vim.cmd.IlluminateToggleBuf)
	end,
})
