local Module = require ("config.Module")

local GitModule = Module:new ("Git", {
	{
		"lewis6991/gitsigns.nvim",
		config = function ()
			require('gitsigns').setup {
				signcolumn = false,  -- Toggle with `:Gitsigns toggle_signs`
				numhl      = true, -- Toggle with `:Gitsigns toggle_numhl`
				linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
				word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
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
})

return GitModule
