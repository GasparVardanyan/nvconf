local Module = require ("modular.Module")

local RestModule = Module:new ({
	name = "Rest",
	priority = 1000,
	plugins = {
		require ("modular.specs.Rest.rest_nvim")
	},
})

return RestModule
