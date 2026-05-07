local Module = require ("modular.Module")
local ModuleAction = require ("modular.ModuleAction")

local LspSagaModule = Module:new ({
	name = "LspSaga",
	plugins = {
		require ("modular.specs.LspSaga.lspsaga_nvim"),
	},
	actions = {
		ModuleAction:new ({
			event = ModuleAction.EventType.Pre,
			plugins = "lspsaga.nvim",
			action = function ()
				local reg_mapping_group = require ("modular.utils").reg_mapping_group
				reg_mapping_group ("<leader>ls",  "saga")
			end
		}),
		ModuleAction:new ({
			plugins = "lspsaga.nvim",
			action = function ()
				require ("modular.mappings.LspSaga.lspsaga_nvim")
			end
		}),
	}
})

return LspSagaModule
