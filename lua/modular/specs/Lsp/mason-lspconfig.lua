return {
	"williamboman/mason-lspconfig.nvim",
	dependencies = {
		"neovim/nvim-lspconfig",
		"williamboman/mason.nvim",
	},
	config = function ()
		local capabilities = vim.lsp.protocol.make_client_capabilities ()

		local servers = require ("modular.mason.lspservers")
		local ensure_installed = require ("modular.mason")
		require ("mason-tool-installer").setup { ensure_installed = ensure_installed }

		require ("mason-lspconfig").setup {
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
	end
}
