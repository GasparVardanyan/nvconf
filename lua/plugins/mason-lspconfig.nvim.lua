return {
	"williamboman/mason-lspconfig.nvim",
	dependencies = { "williamboman/mason.nvim" },
	lazy = true,
	config = true,
	opts = {
		ensure_installed = { "lua_ls", "clangd" }
	},
}
