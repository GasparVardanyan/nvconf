local Module = require ("config.Module")

local GitModule = Module:new ("Git", {
	{ -- VERIFIED
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

	{ -- VERIFIED
		"sindrets/diffview.nvim",
		config = true,
	},

	{ -- VERIFIED TODO: Test
		"kdheepak/lazygit.nvim",
		lazy = true,
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

	{ -- VERIFIED
		"tpope/vim-fugitive",
	},
})

return GitModule
