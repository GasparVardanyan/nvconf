local Module = require ("config.Module")

local GitModule = Module:new ({
	name = "Git",
	plugins = {
		{
			"lewis6991/gitsigns.nvim",
			config = function ()
				require("gitsigns").setup {
					signcolumn = false,
					numhl      = true,
					linehl     = false,
					word_diff  = false,
				}
			end,
		},

		{
			"sindrets/diffview.nvim",
			config = true,
		},

		{
			"kdheepak/lazygit.nvim",
			lazy = false,
			cmd = {
				"LazyGit",
				"LazyGitConfig",
				"LazyGitCurrentFile",
				"LazyGitFilter",
				"LazyGitFilterCurrentFile",
			},
			-- optional for floating window border decoration
			dependencies = {
				"nvim-lua/plenary.nvim",
			},
		},

		{
			"tpope/vim-fugitive",
		},
	}
})

return GitModule
