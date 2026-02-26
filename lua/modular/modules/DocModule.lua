local Module = require ("modular.Module")

local DocModule = Module:new ({
	name = "Doc",
	plugins = {
		require ("modular.specs.Doc.zeavim_vim"),
	},
})

return DocModule
