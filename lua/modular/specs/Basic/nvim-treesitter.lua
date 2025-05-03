return { -- TODO: check nvchad/lazyvim setup
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPost", "BufNewFile" },
	-- cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
	build = ":TSUpdate",
	opts = {
		ensure_installed = require ("modular.config.treesitters"),
		highlight = {
			enable = true,
			use_languagetree = true,
		},
		indent = { enable = true },
	},
	config = function(_, opts)
		require("nvim-treesitter.configs").setup(opts)
	end,
}
