return {
	"williamboman/mason-lspconfig.nvim",
	dependencies = {
		"neovim/nvim-lspconfig",
		"williamboman/mason.nvim",
	},
	config = function ()
		local capabilities = vim.lsp.protocol.make_client_capabilities ()

		local servers = require ("modular.config.lspservers")

		for server_name, server in pairs (servers) do
			server.capabilities = vim.tbl_deep_extend (
				"force",
				{}, -- TODO: understand why this empty table is here
				capabilities,
				server.capabilities or {}
			)
			require ("lspconfig") [server_name].setup (server)
		end

		require ("mason-lspconfig").setup {
			ensure_installed = {},
			automatic_installation = false,
			handlers = {
				function(server_name)
					print ("this thing now works, review !!")
					vim.cmd ('qa')

					local server = servers [server_name] or {}
					server.capabilities = vim.tbl_deep_extend (
						"force",
						{}, -- TODO: understand why this empty table is here
						capabilities,
						server.capabilities or {}
					)
					require ("lspconfig") [server_name].setup (server)
				end,
			},
		}
	end
}
