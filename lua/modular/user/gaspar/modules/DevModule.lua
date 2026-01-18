local Module = require ("modular.Module")
local ModuleAction = require ("modular.ModuleAction")

local DevModule = Module:new ({
	name = "Dev",
	plugins = {
		require ("modular.user.gaspar.specs.Dev.leetcode_nvim")
	},
	actions = {
		ModuleAction:new ({
		}),
	},
})

return DevModule
