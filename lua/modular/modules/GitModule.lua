local Module = require ("modular.Module")
local ModuleAction = require ("modular.ModuleAction")

local GitModule = Module:new ({
	name = "Git",
	plugins = {
		require ("modular.specs.Git.diffview_nvim"),
		require ("modular.specs.Git.gitsigns_nvim"),
		require ("modular.specs.Git.lazygit_nvim"),
		require ("modular.specs.Git.neogit"),
		require ("modular.specs.Git.vim-fugitive"),
		require ("modular.specs.Git.codediff_nvim"),
	},
	actions = {
		ModuleAction:new ({
			plugins = "diffview.nvim",
			action = function ()
				require ("modular.mappings.Git.diffview_nvim")
			end
		}),
		ModuleAction:new ({
			plugins = "gitsigns.nvim",
			action = function ()
				require ("modular.mappings.Git.gitsigns_nvim")
			end
		}),
		ModuleAction:new ({
			plugins = "lazygit.nvim",
			action = function ()
				require ("modular.mappings.Git.lazygit_nvim")
			end
		}),
		ModuleAction:new ({
			plugins = { "fzf-lua" },
			action = function ()
				require ("modular.mappings.Git.fzf-lua")
			end
		}),
		ModuleAction:new ({
			plugins = "telescope.nvim",
			action = function ()
				require ("modular.mappings.Git.telescope_nvim")
			end
		}),
	}
})

return GitModule
