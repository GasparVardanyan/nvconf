local Module = require ("modular.Module")
local ModuleAction = require ("modular.ModuleAction")

local GitModule = Module:new ({
	name = "Git",
	plugins = {
		require ("modular.specs.Git.diffview_nvim"),
		-- require ("modular.specs.Git.diffview-plus_nvim"),
		require ("modular.specs.Git.gitsigns_nvim"),
		require ("modular.specs.Git.lazygit_nvim"),
		require ("modular.specs.Git.neogit"),
		require ("modular.specs.Git.vim-fugitive"),
		require ("modular.specs.Git.codediff_nvim"),
	},
	actions = {
		ModuleAction:new ({
			event = ModuleAction.EventType.Pre,
			plugins = "diffview.nvim",
			action = function ()
				local reg_mapping_group = require ("modular.utils").reg_mapping_group
				reg_mapping_group ("<leader>g",  "git")
			end
		}),
		ModuleAction:new ({
			plugins = "diffview.nvim",
			action = function ()
				require ("modular.mappings.Git.diffview_nvim")
			end
		}),
		ModuleAction:new ({
			event = ModuleAction.EventType.Pre,
			plugins = "diffview-plus.nvim",
			action = function ()
				local reg_mapping_group = require ("modular.utils").reg_mapping_group
				reg_mapping_group ("<leader>g",  "git")
			end
		}),
		ModuleAction:new ({
			plugins = "diffview-plus.nvim",
			action = function ()
				require ("modular.mappings.Git.diffview_nvim")
			end
		}),
		ModuleAction:new ({
			event = ModuleAction.EventType.Pre,
			plugins = "gitsigns.nvim",
			action = function ()
				local reg_mapping_group = require ("modular.utils").reg_mapping_group
				reg_mapping_group ("<leader>g",  "git")
			end
		}),
		ModuleAction:new ({
			plugins = "gitsigns.nvim",
			action = function ()
				require ("modular.mappings.Git.gitsigns_nvim")
			end
		}),
		ModuleAction:new ({
			event = ModuleAction.EventType.Pre,
			plugins = "lazygit.nvim",
			action = function ()
				local reg_mapping_group = require ("modular.utils").reg_mapping_group
				reg_mapping_group ("<leader>g",  "git")
			end
		}),
		ModuleAction:new ({
			plugins = "lazygit.nvim",
			action = function ()
				require ("modular.mappings.Git.lazygit_nvim")
			end
		}),
		ModuleAction:new ({
			event = ModuleAction.EventType.Pre,
			plugins = "fzf-lua",
			action = function ()
				local reg_mapping_group = require ("modular.utils").reg_mapping_group
				reg_mapping_group ("<leader>g",  "git")
			end
		}),
		ModuleAction:new ({
			plugins = "fzf-lua",
			action = function ()
				require ("modular.mappings.Git.fzf-lua")
			end
		}),
		ModuleAction:new ({
			event = ModuleAction.EventType.Pre,
			plugins = "telescope.nvim",
			action = function ()
				local reg_mapping_group = require ("modular.utils").reg_mapping_group
				reg_mapping_group ("<leader>g",  "git")
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
