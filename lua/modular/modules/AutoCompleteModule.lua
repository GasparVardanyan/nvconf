local Module = require ("modular.Module")
local ModuleAction = require ("modular.ModuleAction")

local AutoCompleteModule = Module:new ({
	name = "AutoComplete",
	actions = {
		ModuleAction:new ({
			action = function ()
				require ("modular.mappings.AutoComplete")
			end
		})
	}
})

return AutoCompleteModule
