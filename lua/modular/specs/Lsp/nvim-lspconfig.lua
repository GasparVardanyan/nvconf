return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		local capabilities = vim.lsp.protocol.make_client_capabilities ()

		local servers = require ("modular.mason.lspservers")
		local ensure_installed = require ("modular.mason")
		require("mason-tool-installer").setup { ensure_installed = ensure_installed }

		require("mason-lspconfig").setup {
			ensure_installed = {},
			automatic_installation = false,
			handlers = {
				function(server_name)
					local server = servers [server_name] or {}
					server.capabilities = vim.tbl_deep_extend (
						"force",
						{},
						capabilities,
						server.capabilities or {}
					)
					require ("lspconfig") [server_name].setup (server)
				end,
			},
		}
	end,
}
