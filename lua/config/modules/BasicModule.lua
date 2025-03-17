local Module = require ("config.Module")
local PostPluginLoadAction = require ("config.PostPluginLoadAction")

local BasicModule = Module:new ({
	name = "Basic",
	plugins = {
		require ("config.specs.Basic.telescope_nvim"),
		require ("config.specs.Basic.grug-far_nvim"),
		require ("config.specs.Basic.tagbar"),
		require ("config.specs.Basic.undotree"),
		require ("config.specs.Basic.nvim-treesitter"),
	},
	post_plugin_load_actions = {
		PostPluginLoadAction:new ({
			plugins = "telescope.nvim",
			action = function ()
				require "config.mappings.telescope"
			end
		}),
		PostPluginLoadAction:new ({
			plugins = "grug-far.nvim",
			action = function ()
				require "config.mappings.grug-far"
			end
		}),
		PostPluginLoadAction:new ({
			plugins = "tagbar",
			action = function ()
				require "config.mappings.tagbar"
			end
		}),
		PostPluginLoadAction:new ({
			plugins = "undotree",
			action = function ()
				require "config.mappings.undotree"
			end
		}),
	},
})

return BasicModule
