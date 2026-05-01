local Module = require ("modular.Module")

local RestModule = Module:new ({
	name = "Rest",
	plugins = {
		-- require ("modular.specs.Rest.rest_nvim"),
		require ("modular.specs.Rest.kulala_nvim"),
	},
})

return RestModule
