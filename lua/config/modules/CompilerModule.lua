local Module = require ("config.Module")
local PostPluginLoadAction = require ("config.PostPluginLoadAction")

local CompilerModule = Module:new ({
	name = "Compiler",
	plugins = {
		require ("config.specs.Compiler.cmake-tools_nvim"),
		require ("config.specs.Compiler.compiler_nvim"),
		require ("config.specs.misc.overseer_nvim"),
	},
	post_plugin_load_actions = {
		PostPluginLoadAction:new ({
			plugins = "compiler.nvim",
			action = function ()
				require ("config.mappings.Compiler.compiler_nvim")
			end
		}),
	}
})

return CompilerModule
