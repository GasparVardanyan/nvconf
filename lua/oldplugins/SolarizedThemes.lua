return {
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

-- https://github.com/altercation/vim-colors-solarized
-- https://github.com/lifepillar/vim-solarized8
-- https://github.com/overcache/NeoSolarized
-- https://github.com/romainl/flattened
-- https://github.com/jan-warchol/selenized
-- https://github.com/svrana/neosolarized.nvim
-- https://github.com/ishan9299/nvim-solarized-lua
-- https://github.com/maxmx03/solarized.nvim
-- https://github.com/calind/selenized.nvim
