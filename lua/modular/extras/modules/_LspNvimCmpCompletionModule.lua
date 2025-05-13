local Module = require ("modular.Module")
local ModuleAction = require ("modular.ModuleAction")

local LspNvimCmpCompletionModule = Module:new ({
	name = "LspExtras",
	plugins = {
		require ("modular.extras.specs.LspNvimCmpCompletionModule.nvim-cmp"),
	},
	post_plugin_load_actions = {
		ModuleAction:new ({
			plugins = { "nvim-cmp" },
			action = function ()
			end
		}),
	}
})

return LspNvimCmpCompletionModule
