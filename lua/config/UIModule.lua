local Module = require ("config.Module")

local UIModule = Module:new ({
	name = "UI",
	priority = 1000,
	plugins = {
		{
			"Tsuzat/NeoSolarized.nvim",
			lazy = false,
			priority = 1000,
			opts = {
				transparent = false,
				terminal_colors = false,
			},
			config = true,
		},

		{
			"shaunsingh/solarized.nvim",
			lazy = false,
			priority = 1000,
			config = function ()
				vim.g.solarized_disable_background = false
			end
		},

		{
			"craftzdog/solarized-osaka.nvim",
			lazy = false,
			priority = 1000,
			opts = {
				transparent = false,
				terminal_colors = false,
			},
			config = true,
		},
	}
})

return UIModule
