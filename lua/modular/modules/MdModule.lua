local Module = require ("modular.Module")

-- TODO: refactor these specs and move to the appropriate location
local MdModule = Module:new ({
	name = "Md",
	plugins = {
		require ("modular.specs.Md.render-markdown_nvim"),
	}
})

return MdModule
