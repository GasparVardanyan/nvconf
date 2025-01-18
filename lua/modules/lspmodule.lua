vim.api.nvim_create_autocmd({"User"}, {
	pattern = "LazyDone",

	callback = function()
		require ("lazy").load ({
			plugins = {
				  "mason.nvim"
				, "mason-lspconfig.nvim"
				, "nvim-lspconfig"
				, "nvim-lint"
				, "trouble.nvim"
				, "vim-illuminate"
				, "outline.nvim"
				, "nvim-treesitter-textobjects"
			}
		})
	end
})
