vim.api.nvim_create_autocmd ({"BufNewFile", "BufReadPost"}, {
	pattern = {
		  "*.xdefaults"
		, "*.palette"
		, vim.fn.expand ("~") .. "/.local/etc/theme*"
		, vim.fn.expand ("~") .. "/.urxvt/config"
	},
	callback = function (args)
		local bufnr = args.buf

		vim.api.nvim_buf_set_option (bufnr, 'syntax', 'xdefaults')
	end,
})

