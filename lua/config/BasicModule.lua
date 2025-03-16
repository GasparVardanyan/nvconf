local Module = require ("config.Module")

local BasicModule = Module:new ({
	name = "Basic",
	plugins = {
		require ("config.specs.Basic.telescope_nvim"),
		require ("config.specs.Basic.grug-far_nvim"),
		require ("config.specs.Basic.tagbar"),
		require ("config.specs.Basic.undotree"),
		require ("config.specs.Basic.nvim-treesitter"),
	}
})

return BasicModule
