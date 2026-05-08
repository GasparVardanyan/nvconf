local Module = require ("modular.Module")
local ModuleAction = require ("modular.ModuleAction")

local JavaModule = Module:new ({
	name = "Java",
	plugins = {
		require ("modular.specs.Java.nvim-java"),
		require ("modular.specs.Java.gradle_nvim"),
	},
	actions = {
		ModuleAction:new ({
			event = ModuleAction.EventType.Pre,
			action = function ()
				local TreeSitters = require ("modular.config.treesitters")
				local LspServers = require ("modular.config.lspservers")
				local MasonTools = require ("modular.config.masontools")

				vim.list_extend (TreeSitters, {
					"java",
					"javadoc",
				})
				LspServers ["jdtls"] = {} -- NOTE: nvim-java handles this
				LspServers ["vscode-spring-boot-tools"] = {} -- NOTE: nvim-java handles this
				vim.list_extend (MasonTools, {
					"java-debug-adapter", -- NOTE: nvim-java handles this
					"java-test", -- NOTE: nvim-java handles this
					"vscode-java-decompiler",
					"vscode-java-dependency",
				})

				-- sample nvim-java log:
				-- Installing package jdtls version 1.54.0
				-- Installing package java-test version 0.43.2
				-- Installing package java-debug version 0.58.3
				-- Installing package spring-boot-tools version 1.55.1
				-- Installing package lombok version 1.18.42
				-- Installing package openjdk version 25
			end
		}),
		ModuleAction:new ({
			event = ModuleAction.EventType.Pre,
			plugins = "nvim-java",
			action = function ()
				local reg_mapping_group = require ("modular.utils").reg_mapping_group
				reg_mapping_group ("<leader>j",  "java")
				reg_mapping_group ("<leader>je",  "extract")
				reg_mapping_group ("<leader>jl",  "logs")
				reg_mapping_group ("<leader>jt",  "tests")
				reg_mapping_group ("<leader>jtd",  "debug")
				reg_mapping_group ("<leader>jtr",  "run")
			end
		}),
		ModuleAction:new ({
			plugins = "nvim-java",
			action = function ()
				require ("modular.mappings.Java.nvim-java")
			end
		}),
		ModuleAction:new ({
			event = ModuleAction.EventType.Pre,
			plugins = "gradle.nvim",
			action = function ()
				local reg_mapping_group = require ("modular.utils").reg_mapping_group
				reg_mapping_group ("<leader>jg",  "gradle")
			end
		}),
		ModuleAction:new ({
			plugins = "gradle.nvim",
			action = function ()
				require ("modular.mappings.Java.gradle_nvim")
			end
		}),
	}
})

return JavaModule
