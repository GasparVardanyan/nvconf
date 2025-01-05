vim.api.nvim_create_autocmd({"User"}, {
	pattern = "LazyDone",

	callback = function()
		require ("lazy").load ({
			plugins = {
				  "mason.nvim"
				, "mason-lspconfig.nvim"
				, "nvim-lspconfig"
				, "trouble.nvim"
				, "vim-illuminate"
				, "outline.nvim"
			}
		})
	end
})
