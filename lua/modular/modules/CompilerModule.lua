local Module = require ("modular.Module")
local PostPluginLoadAction = require ("modular.PostPluginLoadAction")

local CompilerModule = Module:new ({
	name = "Compiler",
	plugins = {
		require ("modular.specs.Compiler.cmake-tools_nvim"),
		require ("modular.specs.Compiler.compiler_nvim"),
		require ("modular.specs.misc.overseer_nvim"),
	},
	post_plugin_load_actions = {
		PostPluginLoadAction:new ({
			plugins = "compiler.nvim",
			action = function ()
				require ("modular.mappings.Compiler.compiler_nvim")
			end
		}),
	}
})

return CompilerModule
