vim.api.nvim_create_autocmd ({"BufNewFile", "BufReadPost"}, {
	pattern = { "*.norg" },
	callback = function ()
		vim.cmd [[IlluminateToggleBuf]]
	end,
})
