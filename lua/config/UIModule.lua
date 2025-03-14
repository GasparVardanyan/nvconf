local Module = require ("config.Module")

local UIModule = Module:new ("UI", {
	{ -- VERIFIED
		"Tsuzat/NeoSolarized.nvim",
		lazy = false,
		priority = 1000,
		opts = {
			transparent = false,
			terminal_colors = false,
		},
		config = true,
	},

	{ -- VERIFIED
		"shaunsingh/solarized.nvim",
		lazy = false,
		priority = 1000,
		config = function ()
			vim.g.solarized_disable_background = false
		end
	},

	{ -- VERIFIED
		"craftzdog/solarized-osaka.nvim",
		lazy = false,
		priority = 1000,
		opts = {
			transparent = false,
			terminal_colors = false,
		},
		config = true,
	},
})

return UIModule
