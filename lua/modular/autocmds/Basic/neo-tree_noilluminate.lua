local groups = require ("modular.autogroups")

vim.api.nvim_create_autocmd ("FileType", {
	group = vim.api.nvim_create_augroup (groups.NeoTreeNoIlluminate, { clear = true }),
	pattern = { "neo-tree" },
	callback = function (args)
		local bufnr = args.buf

		vim.api.nvim_buf_call (bufnr, vim.cmd.IlluminateToggleBuf)
	end,
})
