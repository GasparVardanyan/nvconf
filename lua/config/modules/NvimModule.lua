local Module = require ("config.Module")

local NvimModule = Module:new ({
	name = "Nvim",
	plugins = {
		require ("config.specs.Nvim.nvim-nio"),
		require ("config.specs.Nvim.lazydev_nvim"),
	},
})

return NvimModule
