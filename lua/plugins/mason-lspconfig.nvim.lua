return {
	"williamboman/mason-lspconfig.nvim",
	dependencies = { "williamboman/mason.nvim" },
	lazy = true,
	opts = {
	},
	config = function()
		require ('mason-lspconfig').setup ({
			ensure_installed = { "lua_ls", "clangd" }
		})
	end,
}
