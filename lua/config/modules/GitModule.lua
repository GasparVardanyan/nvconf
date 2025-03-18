local Module = require ("config.Module")
local PostPluginLoadAction = require ("config.PostPluginLoadAction")

local GitModule = Module:new ({
	name = "Git",
	plugins = {
		require ("config.specs.Git.diffview_nvim"),
		require ("config.specs.Git.gitsigns_nvim"),
		require ("config.specs.Git.lazygit_nvim"),
		require ("config.specs.Git.vim-fugitive"),
	},
	post_plugin_load_actions = {
		PostPluginLoadAction:new ({
			plugins = "diffview.nvim",
			action = function ()
				require ("config.mappings.Git.diffview_nvim")
			end
		}),
		PostPluginLoadAction:new ({
			plugins = "gitsigns.nvim",
			action = function ()
				require ("config.mappings.Git.gitsigns_nvim")
			end
		}),
		PostPluginLoadAction:new ({
			plugins = "lazygit.nvim",
			action = function ()
				require ("config.mappings.Git.lazygit_nvim")
			end
		})
	}
})

return GitModule
