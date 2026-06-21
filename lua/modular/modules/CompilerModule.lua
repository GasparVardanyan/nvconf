local Module = require ("modular.Module")
local ModuleAction = require ("modular.ModuleAction")

local CompilerModule = Module:new ({
	name = "Compiler",
	plugins = {
		require ("modular.specs.Compiler.cmake-tools_nvim"),
		require ("modular.specs.Compiler.compiler_nvim"),
		require ("modular.specs.Compiler.neovim-tasks"),
		require ("modular.specs.Compiler.sanity_nvim"),
		require ("modular.specs.Misc.overseer_nvim"),
	},
	actions = {
		ModuleAction:new ({
			event = ModuleAction.EventType.Pre,
			action = function ()
				local TreeSitters = require ("modular.config.treesitters")
				local LspServers = require ("modular.config.lspservers")

				vim.list_extend (TreeSitters, { "cmake" })
				LspServers ["neocmake"] = {}
			end
		}),
		ModuleAction:new ({
			event = ModuleAction.EventType.Pre,
			plugins = "compiler.nvim",
			action = function ()
				local reg_mapping_group = require ("modular.utils").reg_mapping_group
				reg_mapping_group ("<leader>c",  "compiler")
			end
		}),
		-- ModuleAction:new ({
		-- 	plugins = "compiler.nvim",
		-- 	action = function ()
		-- 		require ("modular.mappings.Compiler.compiler_nvim")
		-- 	end
		-- }),
		ModuleAction:new ({
			event = ModuleAction.EventType.Pre,
			plugins = "cmake-tools.nvim",
			action = function ()
				local reg_mapping_group = require ("modular.utils").reg_mapping_group
				reg_mapping_group ("<leader>c",  "compiler")
				reg_mapping_group ("<leader>co",  "cmake open")
				reg_mapping_group ("<leader>cc",  "cmake close")
				reg_mapping_group ("<leader>cs",  "cmake stop")
			end
		}),
		ModuleAction:new ({
			plugins = "cmake-tools.nvim",
			action = function ()
				require ("modular.mappings.Compiler.cmake-tools_nvim")
				require ("modular.autocmds.Compiler.cmake-tools_nvim")
			end
		}),
	}
})

return CompilerModule
