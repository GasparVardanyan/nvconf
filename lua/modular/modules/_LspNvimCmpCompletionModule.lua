local Module = require ("modular.Module")
local ModuleAction = require ("modular.ModuleAction")

local LspNvimCmpCompletionModule = Module:new ({
	name = "LspExtras",
	plugins = {
		require ("modular.specs.LspNvimCmpCompletionModule.nvim-cmp"),
	},
	actions = {
		ModuleAction:new ({
			plugins = { "nvim-cmp" },
			action = function ()
			end
		}),
	}
})

return LspNvimCmpCompletionModule
