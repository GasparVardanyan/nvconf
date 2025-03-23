local Module = require ("modular.Module")

local NvimModule = Module:new ({
	name = "Nvim",
	plugins = {
		require ("modular.specs.Nvim.nvim-nio"),
		require ("modular.specs.Nvim.lazydev_nvim"),
	},
})

return NvimModule
