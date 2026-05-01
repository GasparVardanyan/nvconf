
local Module = require ("modular.Module")
local ModuleAction = require ("modular.ModuleAction")

local JavaModule = Module:new ({
	name = "Java",
	plugins = {
		{
			"nvim-java/nvim-java",
			config = true,
		},
	},
	actions = {
		ModuleAction:new ({
			event = ModuleAction.EventType.Pre,
			action = function ()
				local TreeSitters = require ("modular.config.treesitters")
				local LspServers = require ("modular.config.lspservers")
				local MasonTools = require ("modular.config.masontools")

				vim.list_extend (TreeSitters, { "java" })
				LspServers ["jdtls"] = {}
				LspServers ["vscode-spring-boot-tools"] = {}
				vim.list_extend (MasonTools, {
					"java-debug-adapter",
					"java-test",
					"vscode-java-decompiler",
					"vscode-java-dependency",
				})
			end
		}),
		ModuleAction:new ({
			event = ModuleAction.EventType.Pre,
			plugins = "nvim-java",
			action = function ()
				local reg_mapping_group = require ("modular.utils").reg_mapping_group
				reg_mapping_group ("<leader>j",  "java")
			end
		}),
		ModuleAction:new ({
			plugins = "nvim-java",
			action = function ()
				require ("modular.mappings.Java.nvim-java")
			end
		}),
	}
})

return JavaModule
