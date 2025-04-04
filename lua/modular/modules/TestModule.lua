local Module = require ("modular.Module")

local TestModule = Module:new ({
	name = "Test",
	plugins = {
		require ("modular.specs.Test.neotest")
	},
})

return TestModule
