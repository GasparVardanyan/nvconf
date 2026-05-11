local Module = require ("modular.Module")
local ModuleAction = require ("modular.ModuleAction")

local ClangModule = Module:new ({
	name = "Clang",
	plugins = {
		require ("modular.specs.Clang.cppman_nvim"),
		require ("modular.specs.Clang.clangd_extensions_nvim"),
		require ("modular.specs.Clang.insights_nvim"),
		require ("modular.specs.Clang.compiler-explorer_nvim"),
	},
	actions = {
		ModuleAction:new ({
			event = ModuleAction.EventType.Pre,
			action = function ()
				local reg_mapping_group = require ("modular.utils").reg_mapping_group
				reg_mapping_group ("<leader>C",  "clang")

				require ("modular.autocmds.Clang.iwyu")
				require ("modular.mappings.Clang.iwyu")

				local TreeSitters = require ("modular.config.treesitters")
				local LspServers = require ("modular.config.lspservers")
				local MasonTools = require ("modular.config.masontools")
				local LintersByFt = require ("modular.config.linters_by_ft")
				local Formatters = require ("modular.config.formatters")

				vim.list_extend (TreeSitters, { "c", "cpp" })

				local nproc = require ("modular.utils").nproc
				local jnproc = ''

				if 0 ~= nproc
				then
					jnproc =  "--j=" .. (nproc - 1)
				end

				LspServers ["clangd"] = {
					cmd = {
						"clangd",
						"--background-index",
						jnproc,
						"--header-insertion=iwyu",
						"--clang-tidy",
					},
				}

				vim.list_extend (MasonTools, {
					"clang-format",
					"codelldb",
					"cpplint",
				})

				LintersByFt ["c"] = {
					-- "clangtidy",
					"cppcheck",
				}

				LintersByFt ["cpp"] = {
					-- "clangtidy",
					"cppcheck",
				}

				Formatters.formatters_by_ft ["c"] = {
					"clang-format",
				}

				Formatters.formatters_by_ft ["cpp"] = {
					"clang-format",
				}
			end
		}),
		ModuleAction:new ({
			plugins = "cppman.nvim",
			action = function ()
				require ("modular.mappings.Clang.cppman_nvim")
			end
		}),
		ModuleAction:new ({
			plugins = "clangd_extensions.nvim",
			action = function ()
				require ("modular.mappings.Clang.clangd_extensions_nvim")
			end
		}),
		ModuleAction:new ({
			plugins = "insights.nvim",
			action = function ()
				require ("modular.mappings.Clang.insights_nvim")
			end
		}),
		ModuleAction:new ({
			event = ModuleAction.EventType.Pre,
			plugins = "compiler-explorer.nvim",
			action = function ()
				local reg_mapping_group = require ("modular.utils").reg_mapping_group
				reg_mapping_group ("<leader>Ce",  "compiler explorer")

				local TreeSitters = require ("modular.config.treesitters")
				vim.list_extend (TreeSitters, { "asm" })
			end
		}),
		ModuleAction:new ({
			plugins = "compiler-explorer.nvim",
			action = function ()
				require ("modular.mappings.Clang.compiler-explorer_nvim")
			end
		}),
	}
})

return ClangModule
