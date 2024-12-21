vim.api.nvim_create_autocmd({"User"}, {
	pattern = "LazyDone",

	callback = function()
		require ("lazy").load ({
			plugins = {
				  "mason.nvim"
				, "nvim-lspconfig"
				, "vim-illuminate"
			}
		})
	end
})
