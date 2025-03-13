vim.api.nvim_create_autocmd({"User"}, {
	pattern = "LazyDone",

	callback = function()
		require ("lazy").load ({
			plugins = {
				  "gitsigns.nvim"
				, "diffview.nvim"
				, "lazygit.nvim"
				, "vim-fugitive"
			}
		})
	end
})
