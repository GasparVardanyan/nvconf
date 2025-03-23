return {
	"jay-babu/mason-nvim-dap.nvim",
	event = "VeryLazy",
	config = true,
	dependencies = {
		"williamboman/mason.nvim",
		"mfussenegger/nvim-dap",
	},
	opts = {
		handlers = {},
		ensure_installed = {
			"codelldb",
		},
	},
}
