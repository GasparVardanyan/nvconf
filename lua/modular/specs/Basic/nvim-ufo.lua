return {
	"kevinhwang91/nvim-ufo",
	dependencies = {
		"kevinhwang91/promise-async",
		"williamboman/mason-lspconfig.nvim", -- NOTE: load only after mason-lspconfig
												-- sets the capabilities
	},
	config = true
}
