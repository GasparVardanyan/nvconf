local Module = require ("config.Module")

-- TODO: refactor these specs and move to the appropriate location
local CompilerModule = Module:new ({
	name = "Compiler",
	plugins = {
		require ("config.specs.Compiler.cmake-tools_nvim"),
		require ("config.specs.Compiler.compiler_nvim"),
		require ("config.specs.misc.overseer_nvim"),
	}
})

return CompilerModule
