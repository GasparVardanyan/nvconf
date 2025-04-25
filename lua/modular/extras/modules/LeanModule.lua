local Module = require ("modular.Module")

local LeanModule = Module:new ({
	name = "Lean",
	plugins = {
		require ("modular.extras.specs.Lean.lean_nvim"),
	},
})

return LeanModule
