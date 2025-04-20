local Module = require ("modular.Module")
local PostPluginLoadAction = require ("modular.PostPluginLoadAction")

local LspNativeCompletionModuleModule = Module:new ({
	name = "LspNativeCompletionModule",
	plugins = {
	},
	post_plugin_load_actions = {
		PostPluginLoadAction:new ({
			plugins = "nvim-lspconfig",
			action = function ()
				require ("modular.autocmds.LspNativeCompletionModule.nvim-lspconfig")
			end
		}),
	}
})

return LspNativeCompletionModuleModule
