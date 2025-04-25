return {
	"WhoIsSethDaniel/mason-tool-installer.nvim",
	dependencies = {
		"williamboman/mason.nvim",
	},
	config = function ()
		local servers = require ("modular.config.lspservers")

		local m_tools = vim.tbl_keys (servers)
		vim.list_extend (m_tools, require ("modular.config.masontools"))

		require ("mason-tool-installer").setup {
			ensure_installed = m_tools
		}
	end
}
