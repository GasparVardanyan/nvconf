return {
	"williamboman/mason-lspconfig.nvim",
	dependencies = {
		"neovim/nvim-lspconfig",
		"williamboman/mason.nvim",
		"antosha417/nvim-lsp-file-operations",
	},
	config = function ()
		-- TODO: modular.config.lspcapabilities
		-- FIXME: move to the corect place
		local capabilities = vim.tbl_deep_extend (
			"force",
			vim.lsp.protocol.make_client_capabilities (),
			-- returns configured operations if setup() was already called
			-- or default operations if not
			require ("lsp-file-operations").default_capabilities ()
		)

		capabilities.textDocument.foldingRange = {
			dynamicRegistration = false,
			lineFoldingOnly = true
		}

		local servers = require ("modular.config.lspservers")

		for server_name, server in pairs (servers) do
			server.capabilities = vim.tbl_deep_extend (
				"force",
				{}, -- TODO: understand why this empty table is here
				capabilities,
				server.capabilities or {}
			)
			vim.lsp.config (server_name, server)
			vim.lsp.enable (server_name)
		end
	end
}
