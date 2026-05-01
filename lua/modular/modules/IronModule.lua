local Module = require ("modular.Module")
local ModuleAction = require ("modular.ModuleAction")

local IronModule = Module:new ({
	name = "Iron",
	plugins = {
		require ("modular.specs.Iron.iron_nvim"),
	},
	actions = {
		ModuleAction:new ({
			event = ModuleAction.EventType.Pre,
			plugins = "iron.nvim",
			action = function ()
				local reg_mapping_group = require ("modular.utils").reg_mapping_group
				reg_mapping_group ("<leader>i",  "iron")
			end
		}),
	},
})

return IronModule
