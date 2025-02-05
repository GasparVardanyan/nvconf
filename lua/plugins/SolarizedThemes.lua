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
	}
}
