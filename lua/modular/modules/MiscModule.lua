local Module = require ("modular.Module")
local PostPluginLoadAction = require ("modular.PostPluginLoadAction")

local MiscModule = Module:new ({
	name = "Misc",
	plugins = {
		require ("modular.specs.Misc.vim-table-mode")
	},
	post_plugin_load_actions = {
		PostPluginLoadAction:new ({
			plugins = "mason.nvim",
			action = function ()
					require ("modular.mappings.Misc.mason_nvim")
			end
		}),
	}
})

return MiscModule
