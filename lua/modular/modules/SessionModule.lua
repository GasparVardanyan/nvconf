local Module = require ("modular.Module")
local ModuleAction = require ("modular.ModuleAction")

local SessionModule = Module:new ({
	name = "Session",
	actions = {
		ModuleAction:new ({
			action = function ()
				require ("modular.autocmds.Session")
			end
		})
	}
})

return SessionModule
