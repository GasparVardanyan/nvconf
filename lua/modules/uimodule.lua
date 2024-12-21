vim.api.nvim_create_autocmd({"User"}, {
	pattern = "LazyDone",

	callback = function()
		vim.cmd [[
			colorscheme NeoSolarized
		]]

		require ("lazy").load ({
			plugins = {
				"nvim-treesitter"
			}
		})
	end
})
