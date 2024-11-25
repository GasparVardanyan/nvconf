vim.api.nvim_create_autocmd({"User"}, {
	pattern = "LazyDone",
	callback = function()
		require ("telescope").setup ()
		require ("nvim-tree").setup ()
		require ("spectre").setup ()
		require ("nvim-treesitter").setup ()
		require ("gitsigns").setup ()
		require ("diffview").setup ()

		vim.cmd [[
			colorscheme NeoSolarized
		]]
	end
})

-- require ("lazygit").setup ()
-- require ("tagbar").setup ()
-- require ("undotree").setup ()

-- conform, mason, nvim-lspconfig, nvim-illuminate
