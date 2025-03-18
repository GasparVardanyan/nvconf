vim.api.nvim_create_autocmd ({"BufNewFile", "BufReadPost"}, {
	pattern = { "*.norg" },
	callback = function ()
		vim.cmd [[
			setlocal nonu nornu conceallevel=3 concealcursor=nv
		]]
	end
})
