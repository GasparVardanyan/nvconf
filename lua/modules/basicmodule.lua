vim.api.nvim_create_autocmd({"User"}, {
	pattern = "LazyDone",

	callback = function()
		require ("lazy").load ({
			plugins = {
				  "telescope.nvim"
				, "nvim-tree.lua"
				, "nvim-spectre"
--				, "tagbar"
				, "undotree"
				, "nvim-treesitter"
			}
		})
	end
})
