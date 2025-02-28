vim.api.nvim_create_autocmd({"User"}, {
	pattern = "LazyDone",

	callback = function()
		require ("lazy").load ({
			plugins = {
				"neorg",
				"image.nvim",
				"tree-sitter-norg",
				"orgmode"
			}
		})
	end
})
