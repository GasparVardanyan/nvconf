local Module = require ("modular.Module")
local PostPluginLoadAction = require ("modular.PostPluginLoadAction")

local LspExtraMappingsModule = Module:new ({
	name = "LspExtraMappings",
	post_plugin_load_actions = {
		PostPluginLoadAction:new ({
			plugins = "nvim-lspconfig",
			action = function ()
				require ("modular.extras.mappings.LspExtraMappings.nvim-lspconfig")
			end
		}),
	}
})

return LspExtraMappingsModule
