local Module = require ("modular.Module")

local CustomModule = Module:new ({
	name = "Custom",
	plugins = {
		require ("modular.user.gaspar.specs.Custom.iron_nvim"),
		-- require ("modular.user.gaspar.specs.Custom.lualine_nvim"),
		require ("modular.user.gaspar.specs.Custom.csvview_nvim"),
		require ("modular.user.gaspar.specs.Custom.treesj"),
		require ("modular.user.gaspar.specs.Custom.nvim-fundo"),
		require ("modular.user.gaspar.specs.Custom.nvim-bqf"),
		require ("modular.user.gaspar.specs.Custom.fzf"),
		require ("modular.user.gaspar.specs.Custom.dooku-nvim"),
		-- require ("modular.user.gaspar.specs.Custom.nvim-ufo"),
	},
})

return CustomModule
