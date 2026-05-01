local Module = require ("modular.Module")
local ModuleAction = require ("modular.ModuleAction")

local TestModule = Module:new ({
	name = "Test",
	plugins = {
		require ("modular.specs.Test.neotest")
	},
	actions = {
		ModuleAction:new ({
			event = ModuleAction.EventType.Pre,
			plugins = "neotest",
			action = function ()
				local reg_mapping_group = require ("modular.utils").reg_mapping_group
				reg_mapping_group ("<leader>t",  "neotest")
			end
		}),
		ModuleAction:new ({
			plugins = "neotest",
			action = function ()
				require ("modular.mappings.Test.neotest")
			end
		}),
	}
})

return TestModule
