vim.api.nvim_create_autocmd({"User"}, {
	pattern = "LazyDone",

	callback = function()
		vim.cmd [[
			colorscheme NeoSolarized
		]]

		require ("lazy").load ({
			plugins = {
				  "telescope.nvim"
				, "nvim-tree.lua"
				, "nvim-spectre"
				, "nvim-treesitter"
				, "gitsigns.nvim"
				, "diffview.nvim"
				, "lazygit.nvim"
				, "tagbar"
				, "undotree"
			}
		})

--		require ("lazy").load ({
--			plugins = {
--				  "mason.nvim"
--				, "nvim-lspconfig"
--				, "vim-illuminate"
--			}
--		})
	end
})
