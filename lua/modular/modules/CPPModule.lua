local Module = require ("modular.Module")
local ModuleAction = require ("modular.ModuleAction")

local CPPModule = Module:new ({
	name = "CPP",
	plugins = {
		require ("modular.specs.Clang.cppman_nvim"),
		require ("modular.specs.Clang.clangd_extensions_nvim"),
		require ("modular.specs.Clang.insights_nvim"),
	},
	actions = {
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

return CPPModule
