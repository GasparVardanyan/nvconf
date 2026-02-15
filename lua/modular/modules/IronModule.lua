local Module = require ("modular.Module")

local IronModule = Module:new ({
	name = "Iron",
	plugins = {
		require ("modular.specs.Iron.iron_nvim"),
	},
})

return IronModule
