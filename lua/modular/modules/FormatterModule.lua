local Module = require ("modular.Module")

local FormatterModule = Module:new ({
	name = "Formatter",
	plugins = {
		require ("modular.specs.Formatter.conform_nvim")
	},
})

return FormatterModule
