return {
	{
		"lewis6991/gitsigns.nvim",
		lazy = true,
		event = "User FilePost",
		opts = function()
			-- return require "nvchad.configs.gitsigns"
		end,
	},

	{
		"sindrets/diffview.nvim",
		lazy = true,
	},

	{
		"kdheepak/lazygit.nvim",
		lazy = true,
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
	}
}
