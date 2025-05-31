local Module = require ("modular.Module")
local ModuleAction = require ("modular.ModuleAction")

local LspSagaModule = Module:new ({
	name = "LspSaga",
	plugins = {
		require ("modular.specs.LspSaga.lspsaga_nvim"),
	},
	actions = {
		ModuleAction:new ({
			plugins = "lspsaga.nvim",
			action = function ()
				require ("modular.mappings.LspSaga.lspsaga_nvim")
			end
		}),
		ModuleAction:new ({
			plugins = { "lspsaga.nvim", "which-key.nvim" },
			action = function ()
				require ("modular.autocmds.LspSaga.lspsaga_nvim-whichkey")
			end
		}),
	}
})

return LspSagaModule
