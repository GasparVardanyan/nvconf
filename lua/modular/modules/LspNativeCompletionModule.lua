local Module = require ("modular.Module")
local ModuleAction = require ("modular.ModuleAction")

local LspNativeCompletionModuleModule = Module:new ({
	name = "LspNativeCompletionModule",
	plugins = {
	},
	post_plugin_load_actions = {
		ModuleAction:new ({
			plugins = "nvim-lspconfig",
			action = function ()
				require ("modular.autocmds.LspNativeCompletionModule.nvim-lspconfig")
			end
		}),
	}
})

return LspNativeCompletionModuleModule
