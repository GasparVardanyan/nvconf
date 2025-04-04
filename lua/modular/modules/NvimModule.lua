local Module = require ("modular.Module")

local NvimModule = Module:new ({
	name = "Nvim",
	plugins = {
		require ("modular.specs.Nvim.nvim-nio"),
		require ("modular.specs.Nvim.plenary_nvim"),
		require ("modular.specs.Nvim.lazydev_nvim"),
		require ("modular.specs.Nvim.nui_nvim"),
		require ("modular.specs.Nvim.nvim-dap"),
		require ("modular.specs.Nvim.one-small-step-for-vimkind"),
	},
})

return NvimModule
