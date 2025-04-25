local Module = require ("modular.Module")
local PostPluginLoadAction = require ("modular.PostPluginLoadAction")

local CompilerModule = Module:new ({
	name = "Compiler",
	plugins = {
		require ("modular.specs.Compiler.cmake-tools_nvim"),
		require ("modular.specs.Compiler.compiler_nvim"),
		require ("modular.specs.Misc.overseer_nvim"),
	},
	post_plugin_load_actions = {
		PostPluginLoadAction:new ({
			plugins = "compiler.nvim",
			action = function ()
				require ("modular.mappings.Compiler.compiler_nvim")
			end
		}),
		PostPluginLoadAction:new ({
			plugins = "cmake-tools.nvim",
			action = function ()
				require ("modular.mappings.Compiler.cmake-tools_nvim")
			end
		}),
	}
})

return CompilerModule
