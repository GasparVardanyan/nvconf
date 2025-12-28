return {
	"nvim-neotest/neotest",
	dependencies = {
		"nvim-neotest/nvim-nio",
		"nvim-lua/plenary.nvim",
		"alfaix/neotest-gtest",
		-- "nvim-neotest/neotest-python",
		"antoinemadec/FixCursorHold.nvim",
		"nvim-treesitter/nvim-treesitter",
		"orjangj/neotest-ctest",
	},
	config = function ()
		local lib = require("neotest.lib")
		require("neotest").setup({
			adapters = {
				require ("neotest-gtest").setup ({
					root = lib.files.match_root_pattern(
						"compile_commands.json",
						"compile_flags.txt",
						"WORKSPACE",
						".clangd",
						"init.lua",
						"init.vim",
						"build",
						".git"
					),
					-- which debug adapter to use? dap.adapters.<this debug_adapter> must be defined.
					debug_adapter = "codelldb",
				}),
				-- require ("neotest-python")
				-- require("neotest-ctest").setup({})
			}
		})
	end,
}
