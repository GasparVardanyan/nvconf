local Module = require ("modular.Module")
local PostPluginLoadAction = require ("modular.PostPluginLoadAction")

local LspNvimCmpCompletionModule = Module:new ({
	name = "LspExtras",
	plugins = {
		require ("modular.extras.specs.LspNvimCmpCompletionModule.nvim-cmp"),
	},
	post_plugin_load_actions = {
		PostPluginLoadAction:new ({
			plugins = { "nvim-cmp" },
			action = function ()
			end
		}),
	}
})

return LspNvimCmpCompletionModule
