vim.api.nvim_create_autocmd({"User"}, {
	pattern = "LazyDone",

	callback = function()
		require ("lazy").load ({
			plugins = {
				  "lualine.nvim",
				  "noice.nvim",
			}
		})
		vim.cmd [[
			colorscheme NeoSolarized
		]]
	end
})
