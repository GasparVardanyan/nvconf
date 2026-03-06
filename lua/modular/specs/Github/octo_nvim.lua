return {
	"pwntester/octo.nvim",
	opts = {
		-- or "fzf-lua" or "snacks" or "default"
		picker = "fzf-lua",
		-- bare Octo command opens picker of commands
		enable_builtin = true,
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim",
		-- OR "ibhagwan/fzf-lua",
		-- OR "folke/snacks.nvim",
		"nvim-tree/nvim-web-devicons",
	},
	config = true,
}
