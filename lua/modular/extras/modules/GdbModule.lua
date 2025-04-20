local Module = require ("modular.Module")

local GdbModule = Module:new ({
	name = "Gdb",
	plugins = {
		require ("modular.extras.specs.Gdb.nvim-gdb"),
	},
})

return GdbModule
