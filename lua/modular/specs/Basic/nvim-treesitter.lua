return {
	"nvim-treesitter/nvim-treesitter",
	branch = "master",
	dependencies = {
		"nvim-treesitter/nvim-treesitter-textobjects",
	},
	event = { "BufReadPost", "BufNewFile" },
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter.configs").setup ({
		ensure_installed = require ("modular.config.treesitters"),
		highlight = {
			enable = true,
			use_languagetree = true,
		},
		indent = { enable = true },
		textobjects = require ("modular.config.textobjects")
	})
	end,
}
