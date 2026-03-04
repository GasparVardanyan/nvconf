local Module = require ("modular.Module")
local ModuleAction = require ("modular.ModuleAction")

local CompilerModule = Module:new ({
	name = "Compiler",
	plugins = {
		require ("modular.specs.Compiler.cmake-tools_nvim"),
		require ("modular.specs.Compiler.compiler_nvim"),
		require ("modular.specs.Compiler.neovim-tasks"),
		require ("modular.specs.Misc.overseer_nvim"),
	},
	actions = {
		ModuleAction:new ({
			plugins = "compiler.nvim",
			action = function ()
				require ("modular.mappings.Compiler.compiler_nvim")
			end
		}),
		ModuleAction:new ({
			plugins = "cmake-tools.nvim",
			action = function ()
				require ("modular.mappings.Compiler.cmake-tools_nvim")
			end
		}),
	}
})

return CompilerModule
