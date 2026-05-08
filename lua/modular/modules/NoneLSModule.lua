local Module = require ("modular.Module")

local NoneLSModule = Module:new ({
	name = "NoneLS",
	plugins = {
		require ("modular.specs.NoneLS.none-ls_nvim"),
	},
})

return NoneLSModule
