local Module = require ("modular.Module")
local ModuleAction = require ("modular.ModuleAction")

local TestModule = Module:new ({
	name = "Test",
	plugins = {
		require ("modular.specs.Test.neotest")
	},
	post_plugin_load_actions = {
		ModuleAction:new ({
			plugins = "neotest",
			action = function ()
				require ("modular.mappings.Test.neotest")
			end
		}),
	}
})

return TestModule
