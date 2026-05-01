local Module = require ("modular.Module")
local ModuleAction = require ("modular.ModuleAction")

local ClangModule = Module:new ({
	name = "Clang",
	plugins = {
		require ("modular.specs.Clang.cppman_nvim"),
		require ("modular.specs.Clang.clangd_extensions_nvim"),
		require ("modular.specs.Clang.insights_nvim"),
	},
	actions = {
		ModuleAction:new ({
			event = ModuleAction.EventType.Pre,
			action = function ()
				local TreeSitters = require ("modular.config.treesitters")
				local LspServers = require ("modular.config.lspservers")
				local MasonTools = require ("modular.config.masontools")
				local LintersByFt = require ("modular.config.linters_by_ft")

				vim.list_extend (TreeSitters, { "c", "cpp" })

				LspServers ["clangd"] = {
					cmd = {
						"clangd",
						"--background-index",
						"--j=" .. (require ("modular.utils").nproc - 1),
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
			plugins = { "cppman.nvim", "clangd_extensions.nvim", "which-key.nvim" }, -- TODO: make this plugin independent
			action = function ()
				local wk = require ("which-key")
				wk.add({
					{ "<leader>C", group = "Clang" },
				})
			end
		}),
	}
})

return ClangModule
