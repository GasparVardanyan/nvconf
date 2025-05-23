return {
	"nvim-neotest/neotest",
	dependencies = {
		"nvim-neotest/nvim-nio",
		"nvim-lua/plenary.nvim",
		"alfaix/neotest-gtest",
		"nvim-neotest/neotest-python",
		"antoinemadec/FixCursorHold.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	config = function ()
		require("neotest").setup({
			adapters = {
				require ("neotest-gtest").setup ({}),
				require ("neotest-python")
			}
		})
	end,
}
