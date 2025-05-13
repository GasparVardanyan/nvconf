local Module = require ("modular.Module")
local ModuleAction = require ("modular.ModuleAction")

local ClangModule = Module:new ({
	name = "Clang",
	plugins = {
		require ("modular.extras.specs.Clang.cppman_nvim"),
		require ("modular.extras.specs.Clang.clangd_extensions_nvim"),
	},
	post_plugin_load_actions = {
		ModuleAction:new ({
			plugins = "cppman.nvim",
			action = function ()
				require ("modular.extras.mappings.Clang.cppman_nvim")
			end
		}),
		ModuleAction:new ({
			plugins = "clangd_extensions.nvim",
			action = function ()
				require ("modular.extras.mappings.Clang.clangd_extensions_nvim")
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
